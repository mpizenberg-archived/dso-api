module Dso.EnergyFunctionalStructs exposing (..)

import Dso.AvoidCyclic exposing (EnergyFunctional)
import Dso.HessianBlocks exposing (FrameHessian, PointHessian)
import Dso.NumType exposing (Vec8, Vec8f, VecCf, VecNRf)
import Dso.RawResidualJacobian exposing (RawResidualJacobian)
import Dso.Residuals exposing (PointFrameResidual)


-- MODEL #############################################################


type alias EFResidual =
    -- structural pointers
    { data : PointFrameResidual
    , histIDX : Int
    , targetIDX : Int
    , point : EFPoint
    , host : EFFrame
    , target : EFFrame
    , idxInAll : Int

    -- stuff
    , j : RawResidualJacobian
    , res_toZeroF : VecNRf
    , jpJdF : Vec8f

    -- status
    , isLinearized : Bool

    -- If residual is not OOB and not OUTLIER and should be used during accumulations
    , isActiveAndIsGoodNEW : Bool
    }


{-| Type to avoid cyclic attributes.
-}
type Array_EFResidual
    = Array_EFResidual


type alias EFPoint =
    { data : PointHessian
    , priorF : Float
    , deltaF : Float

    -- constant info (never changes in-between)
    , idxInPoints : Int
    , host : EFFrame

    -- contains all residuals
    , residualsAll : Array_EFResidual

    -- stuff
    , bdSumF : Float
    , hdiF : Float
    , hdd_accLF : Float
    , hcd_accLF : VecCf
    , bd_accLF : Float
    , hdd_accAF : Float
    , hcd_accAF : VecCf
    , bd_accAF : Float

    -- status
    , stateFlag : EFPointStatus
    }


type EFPointStatus
    = PS_GOOD
    | PS_MARGINALIZE
    | PS_DROP


{-| Type to avoid cyclic attributes.
-}
type Array_EFPoint
    = Array_EFPoint


type alias EFFrame =
    -- prior hessian (diagonal)
    { prior : Vec8

    -- state - state_prior
    -- E_prior = (delta_prior)' * diag(prior) * delta_prior
    , delta_prior : Vec8

    -- state - state_zero
    , delta : Vec8
    , points : Array_EFPoint
    , data : FrameHessian

    -- idx in frames
    , idx : Int
    , frameID : Int
    }



-- FUNCTIONS #########################################################
--
--
-- EFResidual methods


takeDataF : EFResidual -> EFResidual
takeDataF self =
    Debug.crash "TODO"


fixLinearizationF : EnergyFunctional -> EFResidual -> EFResidual
fixLinearizationF ef self =
    Debug.crash "TODO"


isActive : EFResidual -> Bool
isActive self =
    self.isActiveAndIsGoodNEW



-- EFPoint methods


takeData : EFPoint -> EFPoint
takeData self =
    Debug.crash "TODO"



-- EFFrame methods


takeDataFrame : EFFrame -> EFFrame
takeDataFrame self =
    Debug.crash "TODO"
