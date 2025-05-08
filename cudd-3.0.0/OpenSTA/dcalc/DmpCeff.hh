// OpenSTA, Static Timing Analyzer
// Copyright (c) 2025, Parallax Software, Inc.
// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.
// 
// The origin of this software must not be misrepresented; you must not
// claim that you wrote the original software.
// 
// Altered source versions must be plainly marked as such, and must not be
// misrepresented as being the original software.
// 
// This notice may not be removed or altered from any source distribution.

#pragma once

#include "LibertyClass.hh"
#include "LumpedCapDelayCalc.hh"

namespace sta {

class DmpAlg;
class DmpCap;
class DmpPi;
class DmpZeroC2;
class GateTableModel;

// Delay calculator using Dartu/Menezes/Pileggi effective capacitance
// algorithm for RSPF loads.
class DmpCeffDelayCalc : public LumpedCapDelayCalc
{
public:
  DmpCeffDelayCalc(StaState *sta);
  virtual ~DmpCeffDelayCalc();
  bool reduceSupported() const override { return true; }
  ArcDcalcResult gateDelay(const Pin *drvr_pin,
                           const TimingArc *arc,
                           const Slew &in_slew,
                           float load_cap,
                           const Parasitic *parasitic,
                           const LoadPinIndexMap &load_pin_index_map,
                           const DcalcAnalysisPt *dcalc_ap) override;
  string reportGateDelay(const Pin *drvr_pin,
                         const TimingArc *arc,
                         const Slew &in_slew,
                         float load_cap,
                         const Parasitic *parasitic,
                         const LoadPinIndexMap &load_pin_index_map,
                         const DcalcAnalysisPt *dcalc_ap,
                         int digits) override;
  void copyState(const StaState *sta) override;

protected:
  virtual void loadDelaySlew(const Pin *load_pin,
                             double drvr_slew,
                             const RiseFall *rf,
                             const LibertyLibrary *drvr_library,
                             const Parasitic *parasitic,
                             // Return values.
                             ArcDelay &wire_delay,
                             Slew &load_slew) = 0;
  void gateDelaySlew(// Return values.
                     double &delay,
		     double &slew);
  void loadDelaySlewElmore(const Pin *load_pin,
                           double elmore,
                           ArcDelay &delay,
                           Slew &slew);
  // Select the appropriate special case Dartu/Menezes/Pileggi algorithm.
  void setCeffAlgorithm(const LibertyLibrary *library,
			const LibertyCell *cell,
			const Pvt *pvt,
			const GateTableModel *gate_model,
			const RiseFall *rf,
			double in_slew,
			double c2,
			double rpi,
			double c1);

  static bool unsuppored_model_warned_;

private:
  // Dmp algorithms for each special pi model case.
  // These objects are reused to minimize make/deletes.
  DmpCap *dmp_cap_;
  DmpPi *dmp_pi_;
  DmpZeroC2 *dmp_zero_c2_;
  DmpAlg *dmp_alg_;
};

} // namespace
