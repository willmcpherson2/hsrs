module Lib where

import Foreign.Ptr
import Foreign.C.Types

#include "hsrs.h"

{#pointer *Point as PointPtr foreign newtype #}

{#fun new_point as ^ { `Double', `Double' } -> `PointPtr' #}

{#fun point_length as ^ { `PointPtr' } -> `Double' #}

{#fun print_point as ^ { `PointPtr' } -> `()' #}

{#fun free_point as ^ { `PointPtr' } -> `()' #}
