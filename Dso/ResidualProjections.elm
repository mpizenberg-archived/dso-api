module Dso.ResidualProjections exposing (scale_idepth)

{-| module ...

@docs scale_idepth

-}

-- UNKNOWN ###########################################################


{-| whatever
-}
scale_idepth : Float
scale_idepth =
    Debug.crash "TODO"


type Vec3f
    = Vec3f


type Mat33f
    = Mat33f


type CalibHessian
    = CalibHessian



-- FUNCTIONS #########################################################


derive_idepth : Vec3f -> Float -> Float -> Int -> Int -> Float -> Float -> Float -> Float
derive_idepth t u v dx dy dxInterp dyInterp drescale =
    Debug.crash "TODO"


projectPoint : Float -> Float -> Float -> Mat33f -> Vec3f -> ( Float, Float, Bool )
projectPoint u_pt v_pt idepth krki kt =
    Debug.crash "TODO"


projectPointDetailed :
    Float
    -> Float
    -> Float
    -> Int
    -> Int
    -> CalibHessian
    -> Mat33f
    -> Vec3f
    -> ( Float, Float, Float, Float, Float, Vec3f, Float, Bool )
projectPointDetailed u_pt v_pt idepth dx dy hCalib r t =
    Debug.crash "TODO"
