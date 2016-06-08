# Main script for the backend of the management zone generation tool
# Copyright (C) 2016 Dainius Masiliunas, William Schuch
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Note: This script only brings different modules in modules/ together.
## No code belonging to one of the modules should go here.

#### Import modules ####

source(modules/input.r)
source(modules/GetOutliers.r)

#### Main script ####

InputImage = Input()



SingleBandImageToOutlierPoints = GetOutliers()