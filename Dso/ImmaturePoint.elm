module Dso.ImmaturePoint
    exposing
        ( ImmaturePoint
        , ImmaturePointStatus
        , ImmaturePointTemporaryResidual
        )

{-| module ...

@docs ImmaturePointStatus, ImmaturePoint, ImmaturePointTemporaryResidual

-}

import Array exposing (Array)
import Dso.HessianBlocks exposing (CalibHessian, FrameHessian)
import Dso.Residuals


-- UNKNOWN ###########################################################


type Mat22f
    = Mat22f


type Mat33f
    = Mat33f


type Vec2f
    = Vec2f


type Vec3f
    = Vec3f



-- MODEL #############################################################


{-| whatever
-}
type ImmaturePointStatus
    = Ips_good
    | Ips_oob
    | Ips_outlier
    | Ips_skipped
    | Ips_BadCondition
    | Ips_uninitialized


{-| whatever
-}
type alias ImmaturePointTemporaryResidual =
    { state_state : Dso.Residuals.ResState
    , state_energy : Float
    , state_NewState : Dso.Residuals.ResState
    , state_NewEnergy : Float
    , target : FrameHessian
    }


{-| whatever
-}
type alias ImmaturePoint =
    -- static values
    { color : Array Float
    , weights : Array Float

    -- energy stuff
    , gradH : Mat22f
    , gradH_ev : Vec2f
    , gradH_eig : Mat22f
    , energyTh : Float
    , u : Float
    , v : Float
    , host : FrameHessian
    , idxInImmaturePoints : Int

    -- stuff
    , quality : Float
    , my_type : Float

    -- stuff
    , idepth_min : Float
    , idepth_max : Float

    -- last stuff
    , lastTraceStatus : ImmaturePointStatus
    , lastTraceUV : Vec2f
    , lastTracePixelInterval : Float

    -- stuff
    , idepth_GT : Float
    }



-- FUNCTIONS #########################################################


init : Int -> Int -> FrameHessian -> Float -> CalibHessian -> ImmaturePoint
init u_ v_ host_ type_ hCalib =
    Debug.crash "TODO"


traceOn : FrameHessian -> Mat33f -> Vec3f -> Vec2f -> CalibHessian -> ImmaturePoint -> ( ImmaturePoint, ImmaturePointStatus )
traceOn frame hostToFrame_krki hostToFrame_kt hostToFrame_affine hCalib model =
    Debug.crash "TODO"


linearizeResidual : CalibHessian -> Float -> ImmaturePointTemporaryResidual -> Float -> Float -> Float -> ImmaturePoint -> ( ImmaturePoint, Float, Float, Float )
linearizeResidual hCalib outlierThSlack tmpRes hdd bd idepth model =
    Debug.crash "TODO"


getdPixdd : CalibHessian -> ImmaturePointTemporaryResidual -> Float -> ImmaturePoint -> Float
getdPixdd hCalib tmpRes idepth model =
    Debug.crash "TODO"


calcResidual : CalibHessian -> Float -> ImmaturePointTemporaryResidual -> Float -> ImmaturePoint -> ( ImmaturePoint, Float )
calcResidual hCalib outlierThSlack tmpRes idepth model =
    Debug.crash "TODO"