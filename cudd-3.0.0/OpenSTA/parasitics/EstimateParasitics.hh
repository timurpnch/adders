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

#include "StaState.hh"
#include "LibertyClass.hh"
#include "NetworkClass.hh"
#include "SdcClass.hh"
#include "ParasiticsClass.hh"

namespace sta {

class Corner;
class StaState;

class EstimateParasitics : public StaState
{
public:
  EstimateParasitics(StaState *sta);
  // Helper function for wireload estimation.
  void estimatePiElmore(const Pin *drvr_pin,
			const RiseFall *rf,
			const Wireload *wireload,
			float fanout,
			float net_pin_cap,
			const Corner *corner,
			const MinMax *min_max,
			// Return values.
			float &c2,
			float &rpi,
			float &c1,
			float &elmore_res,
			float &elmore_cap,
			bool &elmore_use_load_cap);

protected:
  void estimatePiElmoreBest(const Pin *drvr_pin,
			    float net_pin_cap,
			    float wireload_cap,
			    const RiseFall *rf,
			    const Corner *corner,
			    const MinMax *min_max,
			    // Return values.
			    float &c2,
			    float &rpi,
			    float &c1,
			    float &elmore_res,
			    float &elmore_cap,
			    bool &elmore_use_load_cap) const;
  void estimatePiElmoreWorst(const Pin *drvr_pin,
			     float wireload_cap,
			     float wireload_res,
			     float fanout,
			     float net_pin_cap,
			     const RiseFall *rf,
			     const Corner *corner,
			     const MinMax *min_max,
			     // Return values.
			     float &c2, float &rpi, float &c1,
			     float &elmore_res, float &elmore_cap,
			     bool &elmore_use_load_cap);
  void estimatePiElmoreBalanced(const Pin *drvr_pin,
				float wireload_cap,
				float wireload_res,
				float fanout,
				float net_pin_cap,
				const RiseFall *rf,
				const Corner *corner,
				const MinMax *min_max,
				// Return values.
				float &c2, float &rpi, float &c1,
				float &elmore_res, float &elmore_cap,
				bool &elmore_use_load_cap);
};

} // namespace
