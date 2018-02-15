module Dso.HessianBlocks exposing (..)

import Array exposing (Array)
import Dso.AvoidCyclic exposing (EFFrame, EFPoint, ImmaturePoint)
import Dso.FrameShell exposing (FrameShell)
import Dso.MinimalImage exposing (MinimalImageB3)
import Dso.NumType exposing (AffLight, Mat33f, Mat42, Mat66, SE3, Vec10, Vec2, Vec2f, Vec3f, Vec6, VecC)
import Dso.Residuals exposing (PointFrameResidual)
import External.Eigen as Eigen


-- MODEL #############################################################


type alias Defines =
    { scale_idepth : Float
    , scale_xi_rot : Float
    , scale_xi_trans : Float
    , scale_f : Float
    , scale_c : Float
    , scale_w : Float
    , scale_a : Float
    , scale_b : Float

    -- inverses
    , scale_idepth_inverse : Float
    , scale_xi_rot_inverse : Float
    , scale_xi_trans_inverse : Float
    , scale_f_inverse : Float
    , scale_c_inverse : Float
    , scale_w_inverse : Float
    , scale_a_inverse : Float
    , scale_b_inverse : Float
    }


{-| whatever
-}
defines : Defines
defines =
    { scale_idepth = 1.0
    , scale_xi_rot = 1.0
    , scale_xi_trans = 0.5
    , scale_f = 50.0
    , scale_c = 50.0
    , scale_w = 1.0
    , scale_a = 10.0
    , scale_b = 1000.0

    -- inverses
    , scale_idepth_inverse = 1.0 / 1.0
    , scale_xi_rot_inverse = 1.0 / 1.0
    , scale_xi_trans_inverse = 1.0 / 0.5
    , scale_f_inverse = 1.0 / 50.0
    , scale_c_inverse = 1.0 / 50.0
    , scale_w_inverse = 1.0 / 1.0
    , scale_a_inverse = 1.0 / 10.0
    , scale_b_inverse = 1.0 / 1000.0
    }


{-| types to avoid recursive alias type
-}
type ArrayFrameFramePrecalc
    = ArrayFrameFramePrecalc


type ArrayPointHessian
    = ArrayPointHessian


type alias FrameFramePrecalc =
    -- static values
    { instanceCounter : Int
    , host : FrameHessian
    , target : FrameHessian

    -- precalc values
    , pre_rtll : Mat33f
    , pre_krkitll : Mat33f
    , pre_rkitll : Mat33f
    , pre_rtll_0 : Mat33f
    , pre_aff_mode : Vec2f
    , pre_b0_mode : Float
    , pre_ttll : Vec3f
    , pre_kttll : Vec3f
    , pre_ttll_0 : Vec3f

    -- stuff
    , distanceLL : Float
    }


{-| whatever
-}
type alias FrameHessian =
    { efFrame : EFFrame

    -- constant info and pre-calculated values
    , shell : FrameShell

    -- trace, fine tracking
    -- used for direction select (not for gradient histograms etc.)
    , dI : Eigen.Vector3f

    -- coarse tracking / coarse initializer. NAN in [0] only.
    , dIp : Array Eigen.Vector3f

    -- only used for pixel select (histograms etc.). no NAN
    , absSquaredGrad : Array Float

    -- incremental ID for keyframes only
    , frameID : Int
    , instanceCounter : Int
    , idx : Int

    -- photometric calibration stuff
    , frameEnergyTH : Float
    , ab_exposure : Float
    , flaggedForMarginalization : Bool

    -- contains all active points
    , pointHessians : ArrayPointHessian

    -- contains all marginalized points
    -- (fully marginalized, usually because point went OOB)
    , pointHessiansMarginalized : ArrayPointHessian

    -- contains all outlier points (discarded)
    , pointHessiansOut : ArrayPointHessian
    , immaturePoints : Array ImmaturePoint

    -- null spaces
    , nullspaces_pose : Mat66
    , nullspaces_affine : Mat42
    , nullspaces_scale : Vec6

    -- variable info
    , worldToCam_evalPT : SE3
    , state_zero : Vec10
    , state_scaled : Vec10
    , state : Vec10
    , step : Vec10
    , step_backup : Vec10
    , state_backup : Vec10

    -- precalc values
    , pre_worldToCam : SE3
    , pre_camToWorld : SE3
    , targetPrecalc : ArrayFrameFramePrecalc
    , debugImage : MinimalImageB3
    }


{-| whatever
-}
type alias CalibHessian =
    { instanceCounter : Int

    -- VecC stuff
    , value_zero : VecC
    , value_scaled : VecC
    , value_scaledf : VecC
    , value_scaledi : VecC
    , value : VecC
    , step : VecC
    , step_backup : VecC
    , value_backup : VecC
    , value_minus_value_zero : VecC

    -- stuff
    , binv : Array Float
    , b : Array Float
    }


{-| hessian component associated with one point
-}
type alias PointHessian =
    { instanceCounter : Int
    , efPoint : EFPoint

    -- static values: colors in host frame and host-weights residuals
    , color : Array Float
    , weights : Array Float

    -- stuff
    , u : Float
    , v : Float
    , idx : Int
    , energyTh : Float
    , host : FrameHessian
    , hasDepthPrior : Bool
    , my_type : Float

    -- idepth stuff
    , idepth_scaled : Float
    , idepth_zero_scaled : Float
    , idepth_zero : Float
    , idepth : Float
    , step : Float
    , step_backup : Float
    , idepth_backup : Float
    , nullspaces_scale : Float
    , idepth_hessian : Float
    , maxRelBaseline : Float
    , numGoodResiduals : Int

    -- status
    , status : PtStatus

    -- good residuals (not OOB, not Outlier), in arbitrary order
    , residuals : Array PointFrameResidual

    -- residuals of the last two frames ( latest, the_one_before )
    , lastResiduals : ( PointFrameResidual, PointFrameResidual )
    }


type PtStatus
    = Active
    | Inactive
    | Outlier
    | OOB
    | Marginalized



-- FUNCTIONS #########################################################


affFromTo : Vec2 -> Vec2 -> Vec2
affFromTo from to =
    Debug.crash "TODO"



-- FrameHessian functions


setFrameFramePrecalc : FrameHessian -> FrameHessian -> CalibHessian -> FrameFramePrecalc -> FrameFramePrecalc
setFrameFramePrecalc host target hCalib model =
    Debug.crash "TODO"


get_worldToCam_evalPT : FrameHessian -> SE3
get_worldToCam_evalPT model =
    model.worldToCam_evalPT


get_state_zero : FrameHessian -> Vec10
get_state_zero model =
    model.state_zero


get_state : FrameHessian -> Vec10
get_state model =
    model.state


get_state_scaled : FrameHessian -> Vec10
get_state_scaled model =
    model.state_scaled


get_state_minus_stateZero : FrameHessian -> Vec10
get_state_minus_stateZero model =
    Debug.crash "TODO"


w2c_leftEps : FrameHessian -> Vec6
w2c_leftEps model =
    Debug.crash "TODO"


aff_g2l : FrameHessian -> AffLight
aff_g2l model =
    Debug.crash "TODO"


aff_g2l_0 : FrameHessian -> AffLight
aff_g2l_0 model =
    Debug.crash "TODO"


setStateZero : Vec10 -> FrameHessian -> FrameHessian
setStateZero state_zero model =
    Debug.crash "TODO"


setState : Vec10 -> FrameHessian -> FrameHessian
setState state model =
    Debug.crash "TODO"


setStateScaled : Vec10 -> FrameHessian -> FrameHessian
setStateScaled state_scaled model =
    Debug.crash "TODO"


setEvalPT : SE3 -> Vec10 -> FrameHessian -> FrameHessian
setEvalPT worldToCam_evalPT state model =
    Debug.crash "TODO"


setEvalPT_scaled : SE3 -> AffLight -> FrameHessian -> FrameHessian
setEvalPT_scaled worldToCam_evalPT aff_g2l model =
    Debug.crash "TODO"


makeImages : Float -> CalibHessian -> FrameHessian -> FrameHessian
makeImages color hCalib model =
    Debug.crash "TODO"


getPrior : FrameHessian -> Vec10
getPrior model =
    Debug.crash "TODO"


getPriorZero : Vec10
getPriorZero =
    Debug.crash "TODO"



-- CalibHessian functions


fxl : CalibHessian -> Float
fxl model =
    Debug.crash "TODO"


fyl : CalibHessian -> Float
fyl model =
    Debug.crash "TODO"


cxl : CalibHessian -> Float
cxl model =
    Debug.crash "TODO"


cyl : CalibHessian -> Float
cyl model =
    Debug.crash "TODO"


fxli : CalibHessian -> Float
fxli model =
    Debug.crash "TODO"


fyli : CalibHessian -> Float
fyli model =
    Debug.crash "TODO"


cxli : CalibHessian -> Float
cxli model =
    Debug.crash "TODO"


cyli : CalibHessian -> Float
cyli model =
    Debug.crash "TODO"


setValue : VecC -> CalibHessian -> CalibHessian
setValue value model =
    Debug.crash "TODO"


setValueScaled : VecC -> CalibHessian -> CalibHessian
setValueScaled value_scaled model =
    Debug.crash "TODO"


getBGradOnly : Float -> CalibHessian -> Float
getBGradOnly color model =
    Debug.crash "TODO"


getBInvGradOnly : Float -> CalibHessian -> Float
getBInvGradOnly color model =
    Debug.crash "TODO"



-- PointHessian functions


initPointHessian : ImmaturePoint -> CalibHessian -> PointHessian
initPointHessian rawPoint hCalib =
    Debug.crash "TODO"


setPointStatus : PtStatus -> PointHessian -> PointHessian
setPointStatus status model =
    { model | status = status }


setIdepth : Float -> PointHessian -> PointHessian
setIdepth idepth model =
    { model | idepth = idepth, idepth_scaled = defines.scale_idepth * idepth }


setIdepthScaled : Float -> PointHessian -> PointHessian
setIdepthScaled idepth_scaled model =
    { model
        | idepth = defines.scale_idepth_inverse * idepth_scaled
        , idepth_scaled = idepth_scaled
    }


setIdepthZero : Float -> PointHessian -> PointHessian
setIdepthZero idepth model =
    { model
        | idepth_zero = idepth
        , idepth_zero_scaled = defines.scale_idepth * idepth
        , nullspaces_scale = -(idepth * 1.001 - idepth / 1.001) * 500
    }


isOOB : Array FrameHessian -> Array FrameHessian -> PointHessian -> Bool
isOOB toKeep toMarg model =
    Debug.crash "TODO"


isInlierNew : PointHessian -> Bool
isInlierNew model =
    Debug.crash "TODO"
