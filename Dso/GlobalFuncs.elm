module Dso.GlobalFuncs exposing (..)

import Array exposing (Array)
import Dso.IOWrap.ImageDisplay
import Dso.MinimalImage exposing (Vec3b)
import Dso.NumType exposing (Vec3f)
import Dso.Settings
import External.Eigen exposing (Vector2f, Vector3f, Vector4f)


-- Getters


getInterpolatedElement : Array Float -> Float -> Float -> Int -> Float
getInterpolatedElement mat x y width =
    Debug.crash "TODO"


getInterpolatedElement43 : Array Vector4f -> Float -> Float -> Int -> Vector3f
getInterpolatedElement43 mat x y width =
    Debug.crash "TODO"


getInterpolatedElement33 : Array Vector3f -> Float -> Float -> Int -> Vector3f
getInterpolatedElement33 mat x y width =
    Debug.crash "TODO"


{-| Interpolate image and boolean (with an && rule) matrix.
-}
getInterpolatedElement33OverAnd : Array Vector3f -> Array Bool -> Float -> Float -> Int -> ( Vector3f, Bool )
getInterpolatedElement33OverAnd mat overMat x y width =
    Debug.crash "TODO"


{-| Interpolate image and boolean (with an || rule) matrix.
-}
getInterpolatedElement33OverOr : Array Vector3f -> Array Bool -> Float -> Float -> Int -> ( Vector3f, Bool )
getInterpolatedElement33OverOr mat overMat x y width =
    Debug.crash "TODO"


getInterpolatedElement31 : Array Vector3f -> Float -> Float -> Int -> Float
getInterpolatedElement31 mat x y width =
    Debug.crash "TODO"


getInterpolatedElement13BiLin : Array Float -> Float -> Float -> Int -> Vector3f
getInterpolatedElement13BiLin mat x y width =
    Debug.crash "TODO"


getInterpolatedElement33BiLin : Array Vector3f -> Float -> Float -> Int -> Vector3f
getInterpolatedElement33BiLin mat x y width =
    Debug.crash "TODO"


{-| for x=0 returns p[1]
-}
getInterpolatedElement11Cub : Array Float -> Float -> Float
getInterpolatedElement11Cub p x =
    Debug.crash "TODO"


{-| for x=0 returns p[1]
-}
getInterpolatedElement12Cub : Array Float -> Float -> Vector2f
getInterpolatedElement12Cub p x =
    Debug.crash "TODO"


{-| for x=0 returns p[1]
-}
getInterpolatedElement32Cub : Array Vector3f -> Float -> Vector2f
getInterpolatedElement32Cub p x =
    Debug.crash "TODO"


getInterpolatedElement11BiCub : Array Float -> Float -> Float -> Int -> Float
getInterpolatedElement11BiCub mat x y width =
    Debug.crash "TODO"


getInterpolatedElement13BiCub : Array Float -> Float -> Float -> Int -> Vector3f
getInterpolatedElement13BiCub mat x y width =
    Debug.crash "TODO"


getInterpolatedElement33BiCub : Array Vector3f -> Float -> Float -> Int -> Vector3f
getInterpolatedElement33BiCub mat x y width =
    Debug.crash "TODO"


getInterpolatedElement44 : Array Vector4f -> Float -> Float -> Int -> Vector4f
getInterpolatedElement44 mat x y width =
    Debug.crash "TODO"


getInterpolatedElement42 : Array Vector4f -> Float -> Float -> Int -> Vector2f
getInterpolatedElement42 mat x y width =
    Debug.crash "TODO"



-- Setters


makeRainbowf3F : Float -> Vec3f
makeRainbowf3F id =
    Debug.crash "TODO"


makeRainbow3B : Float -> Vec3b
makeRainbow3B id =
    Debug.crash "TODO"


makeJet3B : Float -> Vec3b
makeJet3B id =
    Debug.crash "TODO"


makeRedGreen3B : Float -> Vec3b
makeRedGreen3B id =
    Debug.crash "TODO"
