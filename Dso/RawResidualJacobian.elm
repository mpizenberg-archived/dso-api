module Dso.RawResidualJacobian exposing (..)

import Array exposing (Array)
import Dso.NumType exposing (Mat22f, Vec2f, Vec6f, VecCf, VecNRf)


type alias RawResidualJacobian =
    { resF : VecNRf

    -- two rows of d[x,y]/d[xi], 2x6
    , jpdxi : Array Vec6f

    -- two rows of d[x,y]/d[C], 2x4
    , jpdc : Array VecCf

    -- two rows of d[x,y]/d[idepth], 2x1
    , jpdd : Vec2f

    -- two columns of d[r]/d[x,y], 9x2
    , jIdx : Array VecNRf

    -- two columns of d[r]/d[ab], 9x2
    , jabF : Array VecNRf

    -- transpose jIdx * jIdx (inner product), 2x2
    , jIdx2 : Mat22f

    -- transpose jab * jIdx (inner product), 2x2
    , jabJIdx : Mat22f

    -- transpose jab * jab (inner product), 2x2
    , jab2 : Mat22f
    }
