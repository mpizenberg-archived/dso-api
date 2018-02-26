module Dso.Residuals exposing (..)

import Array exposing (Array)
import Dso.AvoidCyclic exposing (CalibHessian, EFResidual, FrameHessian, PointHessian)
import Dso.GlobalCalib
import Dso.GlobalFuncs
import Dso.IOWrap.ImageDisplay
import Dso.NumType exposing (Vec3f)
import Dso.RawResidualJacobian exposing (RawResidualJacobian)
import External.Eigen as Eigen
import External.Std


-- MODEL #############################################################


{-| Model equivalent to class `dso::PointFrameResidual`
-}
type alias PointFrameResidual =
    { efResidual : EFResidual
    , instanceCounter : Int

    -- State things
    , state_state : ResState
    , state_energy : Float
    , state_NewState : ResState
    , state_NewEnergy : Float
    , state_NewEnergyWithOutlier : Float

    -- Hessian things
    , point : PointHessian
    , host : FrameHessian
    , target : FrameHessian
    , j : RawResidualJacobian

    -- Other stuff
    , isNew : Bool

    -- Projection stuff
    , projectedTo : Array Eigen.Vector2f
    , centerProjectedTo : Vec3f
    }


{-| whatever
-}
type ResState
    = In
    | OOB
    | Outlier


type ResLocation
    = Active
    | Linearized
    | Marginalized
    | None



-- FUNCTIONS #########################################################


setState : ResState -> PointFrameResidual -> PointFrameResidual
setState s model =
    { model | state_state = s }


resetOOB : PointFrameResidual -> PointFrameResidual
resetOOB model =
    { model
        | state_energy = 0
        , state_NewEnergy = 0
        , state_NewState = Outlier
        , state_state = In
    }


init : PointHessian -> FrameHessian -> FrameHessian -> PointFrameResidual
init point host target =
    Debug.crash "TODO"


linearize : CalibHessian -> Float
linearize hCalib =
    Debug.crash "TODO"


applyRes : Bool -> PointFrameResidual -> PointFrameResidual
applyRes copyJacobians model =
    Debug.crash "TODO"
