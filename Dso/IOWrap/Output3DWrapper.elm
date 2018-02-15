module Dso.IOWrap.Output3DWrapper exposing (..)

import Array exposing (Array)
import Dict exposing (Dict)
import Dso.FrameShell exposing (FrameShell)
import Dso.HessianBlocks exposing (CalibHessian, FrameHessian)
import Dso.MinimalImage exposing (MinimalImageB3, MinimalImageF)
import External.Eigen as Eigen


-- MODEL #############################################################


{-| Virtual class
-}
type alias Output3DWrapper =
    {}



-- FUNCTIONS #########################################################


publishGraph : Dict Int Eigen.Vector2i -> Output3DWrapper -> ()
publishGraph connectivity self =
    Debug.crash "TODO"


publishKeyframes : Array FrameHessian -> Bool -> CalibHessian -> Output3DWrapper -> ()
publishKeyframes frames final hCalib self =
    Debug.crash "TODO"


publishCamPose : FrameShell -> CalibHessian -> Output3DWrapper -> ()
publishCamPose frame hCalib self =
    Debug.crash "TODO"


pushLiveFrame : FrameHessian -> Output3DWrapper -> ()
pushLiveFrame image self =
    Debug.crash "TODO"


pushDepthImage : MinimalImageB3 -> Output3DWrapper -> ()
pushDepthImage image self =
    Debug.crash "TODO"


pushDepthImageFloat : MinimalImageF -> FrameHessian -> Output3DWrapper -> ()
pushDepthImageFloat image kf self =
    Debug.crash "TODO"


join : Output3DWrapper -> Output3DWrapper
join self =
    Debug.crash "TODO"


reset : Output3DWrapper -> Output3DWrapper
reset self =
    Debug.crash "TODO"
