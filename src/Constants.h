/*
  Copyright 2011 Bart Vandewoestyne, Yves Frederix.

  This file is part of oaconvert.

  oaconvert is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  oaconvert is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with oaconvert.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <cmath>

namespace Constants
{
const double pi = 4 * std::atan(1.0);
const double feet_in_meter = 0.3048;
const int NBPOINTS = 100;

/* Resolution in Nautical Miles */
// For circles and arcs, we put a point at each nautical mile ( = each 1852 * m).
// TODO: find a good value for RESOLUTION that leads to nice results.  The
// smallest circle I have encountered so far is EHD 61 from the Netherlands and
// it has a radius of 300m.
const double RESOLUTION = 0.5;
}

#endif /* CONSTANTS_H */
