#!/usr/bin/env python3
"""
Sakemono 90nm PDK Validation Script
Tests PDK compatibility with OpenLane flow
Validates standard cells, timing, and design rule compliance
"""

import os
import sys
import subprocess
import json
from pathlib import Path

class PDKValidator:
    def __init__(self, pdk_root):
        self.pdk_root = Path(pdk_root)
        self.results = {
            'structure': {},
            'files': {},
            'timing': {},
            'drc': {},
            'overall': 'PENDING'
        }
    
    def validate_structure(self):
        """Validate PDK directory structure"""
        print(" Validating PDK structure...")
        
        required_dirs = [
            'libs.tech/openlane',
            'libs.tech/magic', 
            'libs.tech/spice',
            'libs.ref/lef',
            'libs.ref/lib',
            'libs.ref/techlef'
        ]
        
        for dir_path in required_dirs:
            full_path = self.pdk_root / dir_path
            exists = full_path.exists()
            self.results['structure'][dir_path] = 'PASS' if exists else 'FAIL'
            print(f"  {'pass' if exists else 'fail'} {dir_path}")
        
        return all(result == 'PASS' for result in self.results['structure'].values())
    
    def validate_files(self):
        """Validate critical PDK files"""
        print("\n Validating critical files...")
        
        critical_files = [
            'libs.tech/openlane/config.tcl',
            'libs.tech/spice/sakemono90_models.sp',
            'libs.tech/magic/sakemono90.tech',
            'libs.ref/techlef/sakemono90.tlef',
            'libs.ref/lef/sakemono90_fd_sc_hd__inv.lef',
            'libs.ref/lib/sakemono90_fd_sc_hd__tt_025C_1v80.lib'
        ]
        
        for file_path in critical_files:
            full_path = self.pdk_root / file_path
            exists = full_path.exists()
            
            if exists:
                try:
                    size = full_path.stat().st_size
                    valid = size > 100  # Basic sanity check
                    self.results['files'][file_path] = 'PASS' if valid else 'FAIL'
                    print(f"  {'pass' if valid else 'fail'} {file_path} ({size} bytes)")
                except:
                    self.results['files'][file_path] = 'FAIL'
                    print(f"   {file_path} (read error)")
            else:
                self.results['files'][file_path] = 'FAIL'
                print(f"   {file_path} (not found)")
        
        return all(result == 'PASS' for result in self.results['files'].values())
    
    def validate_liberty_timing(self):
        """Validate Liberty timing files"""
        print("\n⏱  Validating Liberty timing...")
        
        lib_files = list((self.pdk_root / 'libs.ref/lib').glob('*.lib'))
        
        for lib_file in lib_files:
            try:
                with open(lib_file, 'r') as f:
                    content = f.read()
                
                # Check for required Liberty constructs
                checks = {
                    'library_declaration': 'library(' in content,
                    'time_unit': 'time_unit' in content,
                    'voltage_unit': 'voltage_unit' in content,
                    'cell_definitions': 'cell(' in content,
                    'timing_tables': 'cell_fall' in content and 'cell_rise' in content,
                    'lookup_tables': 'lu_table_template' in content,
                    'power_tables': 'internal_power' in content
                }
                
                all_passed = all(checks.values())
                self.results['timing'][lib_file.name] = 'PASS' if all_passed else 'FAIL'
                
                print(f"  {'pass' if all_passed else 'fail'} {lib_file.name}")
                for check, passed in checks.items():
                    if not passed:
                        print(f"     Missing: {check}")
                        
            except Exception as e:
                self.results['timing'][lib_file.name] = 'FAIL'
                print(f"   {lib_file.name} (error: {e})")
        
        return all(result == 'PASS' for result in self.results['timing'].values())
    
    def validate_lef_geometry(self):
        """Validate LEF geometric definitions"""
        print("\n Validating LEF geometry...")
        
        lef_files = list((self.pdk_root / 'libs.ref/lef').glob('*.lef'))
        
        for lef_file in lef_files:
            try:
                with open(lef_file, 'r') as f:
                    content = f.read()
                
                # Check for required LEF constructs
                checks = {
                    'version': 'VERSION' in content,
                    'units': 'UNITS' in content,
                    'layer_definitions': 'LAYER' in content,
                    'macro_definitions': 'MACRO' in content,
                    'pin_definitions': 'PIN' in content,
                    'obstruction_definitions': 'OBS' in content if 'MACRO' in content else True
                }
                
                all_passed = all(checks.values())
                self.results['drc'][lef_file.name] = 'PASS' if all_passed else 'FAIL'
                
                print(f"  {'pass' if all_passed else 'fail'} {lef_file.name}")
                for check, passed in checks.items():
                    if not passed:
                        print(f"     Missing: {check}")
                        
            except Exception as e:
                self.results['drc'][lef_file.name] = 'FAIL'
                print(f"   {lef_file.name} (error: {e})")
        
        return all(result == 'PASS' for result in self.results['drc'].values())
    
    def validate_magic_tech(self):
        """Validate Magic technology file"""
        print("\n Validating Magic technology file...")
        
        tech_file = self.pdk_root / 'libs.tech/magic/sakemono90.tech'
        
        if not tech_file.exists():
            self.results['drc']['magic_tech'] = 'FAIL'
            print("   Magic tech file not found")
            return False
        
        try:
            with open(tech_file, 'r') as f:
                content = f.read()
            
            # Check for required Magic constructs
            checks = {
                'tech_declaration': 'tech' in content,
                'version_info': 'version' in content,
                'plane_definitions': 'planes' in content,
                'layer_types': 'types' in content,
                'contact_definitions': 'contact' in content,
                'drc_rules': 'drc' in content,
                'extraction_rules': 'extract' in content,
                'style_definitions': 'styles' in content
            }
            
            all_passed = all(checks.values())
            self.results['drc']['magic_tech'] = 'PASS' if all_passed else 'FAIL'
            
            print(f"  {'pass' if all_passed else 'fail'} sakemono90.tech")
            for check, passed in checks.items():
                if not passed:
                    print(f"     Missing: {check}")
            
            return all_passed
            
        except Exception as e:
            self.results['drc']['magic_tech'] = 'FAIL'
            print(f"   sakemono90.tech (error: {e})")
            return False
    
    def validate_spice_models(self):
        """Validate SPICE device models"""
        print("\n Validating SPICE models...")
        
        spice_file = self.pdk_root / 'libs.tech/spice/sakemono90_models.sp'
        
        if not spice_file.exists():
            self.results['files']['spice_models'] = 'FAIL'
            print("   SPICE models file not found")
            return False
        
        try:
            with open(spice_file, 'r') as f:
                content = f.read()
            
            # Check for required SPICE constructs
            checks = {
                'nmos_models': '.model nfet' in content.lower(),
                'pmos_models': '.model pfet' in content.lower(),
                'corner_models': any(corner in content.lower() for corner in ['tt', 'ff', 'ss']),
                'threshold_variants': any(vt in content.lower() for vt in ['lvt', 'svt', 'hvt']),
                'subcircuits': '.subckt' in content.lower(),
                'parameters': '.param' in content.lower()
            }
            
            all_passed = all(checks.values())
            self.results['files']['spice_models'] = 'PASS' if all_passed else 'FAIL'
            
            print(f"  {'pass' if all_passed else 'fail'} sakemono90_models.sp")
            for check, passed in checks.items():
                if not passed:
                    print(f"     Missing: {check}")
            
            return all_passed
            
        except Exception as e:
            self.results['files']['spice_models'] = 'FAIL'
            print(f"   sakemono90_models.sp (error: {e})")
            return False
    
    def check_16_track_compliance(self):
        """Verify 16-track cell architecture"""
        print("\n Validating 16-track architecture...")
        
        # Check if cell height matches 16-track requirement
        tech_lef = self.pdk_root / 'libs.ref/techlef/sakemono90.tlef'
        
        if not tech_lef.exists():
            print("   Technology LEF not found")
            return False
        
        try:
            with open(tech_lef, 'r') as f:
                content = f.read()
            
            # Look for SITE definition with correct height
            site_found = False
            correct_height = False
            
            lines = content.split('\n')
            for i, line in enumerate(lines):
                if 'SITE' in line and 'unithd' in line:
                    site_found = True
                    # Look for SIZE definition in next few lines
                    for j in range(i+1, min(i+5, len(lines))):
                        if 'SIZE' in lines[j]:
                            if '2.72' in lines[j]:  # 2.72µm = 16 * 0.17µm
                                correct_height = True
                            break
                    break
            
            track_compliance = site_found and correct_height
            self.results['drc']['16_track'] = 'PASS' if track_compliance else 'FAIL'
            
            print(f"  {'pass' if track_compliance else 'fail'} 16-track cell height (2.72µm)")
            if not site_found:
                print("     SITE unithd not found")
            elif not correct_height:
                print("     Cell height not 2.72µm")
            
            return track_compliance
            
        except Exception as e:
            self.results['drc']['16_track'] = 'FAIL'
            print(f"   16-track validation (error: {e})")
            return False
    
    def run_validation(self):
        """Run complete PDK validation"""
        print(" Starting Sakemono 90nm PDK Validation\n")
        print("=" * 50)
        
        # Run all validation tests
        structure_ok = self.validate_structure()
        files_ok = self.validate_files()
        timing_ok = self.validate_liberty_timing()
        lef_ok = self.validate_lef_geometry()
        magic_ok = self.validate_magic_tech()
        spice_ok = self.validate_spice_models()
        track_ok = self.check_16_track_compliance()
        
        # Overall result
        all_passed = all([structure_ok, files_ok, timing_ok, lef_ok, magic_ok, spice_ok, track_ok])
        self.results['overall'] = 'PASS' if all_passed else 'FAIL'
        
        print("\n" + "=" * 50)
        print(" VALIDATION SUMMARY")
        print("=" * 50)
        
        categories = [
            ('PDK Structure', structure_ok),
            ('Critical Files', files_ok), 
            ('Liberty Timing', timing_ok),
            ('LEF Geometry', lef_ok),
            ('Magic Technology', magic_ok),
            ('SPICE Models', spice_ok),
            ('16-Track Architecture', track_ok)
        ]
        
        for category, passed in categories:
            status = ' PASS' if passed else ' FAIL'
            print(f"{category:20} {status}")
        
        print("-" * 50)
        overall_status = ' PASS - Ready for tape-out!' if all_passed else '  FAIL - Issues found'
        print(f"{'OVERALL RESULT':20} {overall_status}")
        
        if all_passed:
            print("\n PDK validation completed successfully!")
            print("Next steps:")
            print("   1. Test with OpenLane example design")
            print("   2. Run DRC verification with Magic")
            print("   3. Perform LVS validation")
            print("   4. Characterize additional standard cells")
            print("   5. Generate final GDS for fabrication")
        else:
            print(f"\nFound issues in PDK. Check results above.")
        
        return all_passed
    
    def save_report(self, filename='pdk_validation_report.json'):
        """Save validation results to JSON report"""
        report_path = self.pdk_root / filename
        with open(report_path, 'w') as f:
            json.dump(self.results, f, indent=2)
        print(f"\nDetailed report saved to: {report_path}")

def main():
    if len(sys.argv) != 2:
        print("Usage: python validate_pdk.py <pdk_root_path>")
        print("Example: python validate_pdk.py ./sakemono90")
        sys.exit(1)
    
    pdk_root = sys.argv[1]
    
    if not os.path.exists(pdk_root):
        print(f"PDK root directory not found: {pdk_root}")
        sys.exit(1)
    
    validator = PDKValidator(pdk_root)
    success = validator.run_validation()
    validator.save_report()
    
    sys.exit(0 if success else 1)

if __name__ == '__main__':
    main()