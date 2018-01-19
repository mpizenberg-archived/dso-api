module Dso.NumType exposing (..)

import External.Sophus as Sophus


defines =
    { max_res_per_point = 8
    , num_threads = 6
    , cpars = 4
    }


type alias SE3 =
    Sophus.SE3d


type alias Sim3 =
    Sophus.Sim3d


type alias SO3 =
    Sophus.SO3d


type alias AffLight =
    { a : Float
    , b : Float
    }


fromToVecExposure : Float -> Float -> AffLight -> AffLight -> Vec2
fromToVecExposure exposureF exposureT g2F g2T =
    Debug.crash "TODO"


vec : AffLight -> Vec2
vec model =
    Debug.crash "TODO"



-- VECTORS DOUBLE ####################################################


{-| typedef Eigen::Matrix<double,2,1> Vec2;
-}
type Vec2
    = Vec2


{-| typedef Eigen::Matrix<double,3,1> Vec3;
-}
type Vec3
    = Vec3


{-| typedef Eigen::Matrix<double,4,1> Vec4;
-}
type Vec4
    = Vec4


{-| typedef Eigen::Matrix<double,5,1> Vec5;
-}
type Vec5
    = Vec5


{-| typedef Eigen::Matrix<double,6,1> Vec6;
-}
type Vec6
    = Vec6


{-| typedef Eigen::Matrix<double,7,1> Vec7;
-}
type Vec7
    = Vec7


{-| typedef Eigen::Matrix<double,8,1> Vec8;
-}
type Vec8
    = Vec8


{-| typedef Eigen::Matrix<double,9,1> Vec9;
-}
type Vec9
    = Vec9


{-| typedef Eigen::Matrix<double,10,1> Vec10;
-}
type Vec10
    = Vec10


{-| typedef Eigen::Matrix<double,11,1> Vec11;
-}
type Vec11
    = Vec11


{-| typedef Eigen::Matrix<double,12,1> Vec12;
-}
type Vec12
    = Vec12


{-| typedef Eigen::Matrix<double,13,1> Vec13;
-}
type Vec13
    = Vec13


{-| typedef Eigen::Matrix<double,14,1> Vec14;
-}
type Vec14
    = Vec14



-- VECTORS FLOAT #####################################################


{-| typedef Eigen::Matrix<float,2,1> Vec2f;
-}
type Vec2f
    = Vec2f


{-| typedef Eigen::Matrix<float,3,1> Vec3f;
-}
type Vec3f
    = Vec3f


{-| typedef Eigen::Matrix<float,4,1> Vec4f;
-}
type Vec4f
    = Vec4f


{-| typedef Eigen::Matrix<float,5,1> Vec5f;
-}
type Vec5f
    = Vec5f


{-| typedef Eigen::Matrix<float,6,1> Vec6f;
-}
type Vec6f
    = Vec6f


{-| typedef Eigen::Matrix<float,7,1> Vec7f;
-}
type Vec7f
    = Vec7f


{-| typedef Eigen::Matrix<float,8,1> Vec8f;
-}
type Vec8f
    = Vec8f


{-| typedef Eigen::Matrix<float,9,1> Vec9f;
-}
type Vec9f
    = Vec9f


{-| typedef Eigen::Matrix<float,10,1> Vec10f;
-}
type Vec10f
    = Vec10f


{-| typedef Eigen::Matrix<float,11,1> Vec11f;
-}
type Vec11f
    = Vec11f


{-| typedef Eigen::Matrix<float,12,1> Vec12f;
-}
type Vec12f
    = Vec12f


{-| typedef Eigen::Matrix<float,13,1> Vec13f;
-}
type Vec13f
    = Vec13f


{-| typedef Eigen::Matrix<float,14,1> Vec14f;
-}
type Vec14f
    = Vec14f



-- VECTORS SPECIALS ##################################################


{-| typedef Eigen::Matrix<double,CPARS,1> VecC;
-}
type VecC
    = VecC


{-| typedef Eigen::Matrix<float,CPARS,1> VecCf;
-}
type VecCf
    = VecCf


{-| typedef Eigen::Matrix<double,8+CPARS+1,1> VecPC;
-}
type VecPC
    = VecPC


{-| typedef Eigen::Matrix<float,8+CPARS+1,1> VecPCf;
-}
type VecPCf
    = VecPCf


{-| typedef Eigen::Matrix<double,Eigen::Dynamic,1> VecX;
-}
type VecX
    = VecX


{-| typedef Eigen::Matrix<float,Eigen::Dynamic,1> VecXf;
-}
type VecXf
    = VecXf


{-| typedef Eigen::Matrix<float,MAX_RES_PER_POINT,1> VecNRf;
-}
type VecNRf
    = VecNRf



-- MATRICES DOUBLE ###################################################


{-| typedef Eigen::Matrix<double,1,8> Mat18;
-}
type Mat18
    = Mat18


{-| typedef Eigen::Matrix<double,1,9> Mat19;
-}
type Mat19
    = Mat19


{-| typedef Eigen::Matrix<double,2,2> Mat22;
-}
type Mat22
    = Mat22


{-| typedef Eigen::Matrix<double,3,3> Mat33;
-}
type Mat33
    = Mat33


{-| typedef Eigen::Matrix<double,4,2> Mat42;
-}
type Mat42
    = Mat42


{-| typedef Eigen::Matrix<double,4,3> Mat43;
-}
type Mat43
    = Mat43


{-| typedef Eigen::Matrix<double,4,4> Mat44;
-}
type Mat44
    = Mat44


{-| typedef Eigen::Matrix<double,4,8> Mat48;
-}
type Mat48
    = Mat48


{-| typedef Eigen::Matrix<double,4,9> Mat49;
-}
type Mat49
    = Mat49


{-| typedef Eigen::Matrix<double,5,3> Mat53;
-}
type Mat53
    = Mat53


{-| typedef Eigen::Matrix<double,6,6> Mat66;
-}
type Mat66
    = Mat66


{-| typedef Eigen::Matrix<double,7,7> Mat77;
-}
type Mat77
    = Mat77


{-| typedef Eigen::Matrix<double,8,1> Mat81;
-}
type Mat81
    = Mat81


{-| typedef Eigen::Matrix<double,8,3> Mat83;
-}
type Mat83
    = Mat83


{-| typedef Eigen::Matrix<double,8,4> Mat84;
-}
type Mat84
    = Mat84


{-| typedef Eigen::Matrix<double,8,8> Mat88;
-}
type Mat88
    = Mat88


{-| typedef Eigen::Matrix<double,8,9> Mat89;
-}
type Mat89
    = Mat89


{-| typedef Eigen::Matrix<double,8,10> Mat810;
-}
type Mat810
    = Mat810


{-| typedef Eigen::Matrix<double,9,1> Mat91;
-}
type Mat91
    = Mat91


{-| typedef Eigen::Matrix<double,9,4> Mat94;
-}
type Mat94
    = Mat94


{-| typedef Eigen::Matrix<double,9,8> Mat98;
-}
type Mat98
    = Mat98


{-| typedef Eigen::Matrix<double,10,10> Mat1010;
-}
type Mat1010
    = Mat1010


{-| typedef Eigen::Matrix<double,13,13> Mat1313;
-}
type Mat1313
    = Mat1313


{-| typedef Eigen::Matrix<double,14,14> Mat1414;
-}
type Mat1414
    = Mat1414



-- MATRICES FLOAT ####################################################


{-| typedef Eigen::Matrix<float,1,2> Mat12f;
-}
type Mat12f
    = Mat12f


{-| typedef Eigen::Matrix<float,1,8> Mat18f;
-}
type Mat18f
    = Mat18f


{-| typedef Eigen::Matrix<float,2,2> Mat22f;
-}
type Mat22f
    = Mat22f


{-| typedef Eigen::Matrix<float,3,3> Mat33f;
-}
type Mat33f
    = Mat33f


{-| typedef Eigen::Matrix<float,4,2> Mat42f;
-}
type Mat42f
    = Mat42f


{-| typedef Eigen::Matrix<float,4,4> Mat44f;
-}
type Mat44f
    = Mat44f


{-| typedef Eigen::Matrix<float,6,2> Mat62f;
-}
type Mat62f
    = Mat62f


{-| typedef Eigen::Matrix<float,6,6> Mat66f;
-}
type Mat66f
    = Mat66f


{-| typedef Eigen::Matrix<float,8,4> Mat84f;
-}
type Mat84f
    = Mat84f


{-| typedef Eigen::Matrix<float,8,8> Mat88f;
-}
type Mat88f
    = Mat88f


{-| typedef Eigen::Matrix<float,9,9> Mat99f;
-}
type Mat99f
    = Mat99f


{-| typedef Eigen::Matrix<float,10,3> Mat103f;
-}
type Mat103f
    = Mat103f


{-| typedef Eigen::Matrix<float,10,10> Mat1010f;
-}
type Mat1010f
    = Mat1010f


{-| typedef Eigen::Matrix<float,12,12> Mat1212f;
-}
type Mat1212f
    = Mat1212f


{-| typedef Eigen::Matrix<float,13,13> Mat1313f;
-}
type Mat1313f
    = Mat1313f


{-| typedef Eigen::Matrix<float,14,14> Mat1414f;
-}
type Mat1414f
    = Mat1414f



-- MATRICES SPECIALS #################################################


{-| typedef Eigen::Matrix<float,Eigen::Dynamic,Eigen::Dynamic> MatXXf;
-}
type MatXXf
    = MatXXf


{-| typedef Eigen::Matrix<double,CPARS,10> MatC10;
-}
type MatC10
    = MatC10


{-| typedef Eigen::Matrix<double,8,CPARS> Mat8C;
-}
type Mat8C
    = Mat8C


{-| typedef Eigen::Matrix<double,CPARS,8> MatC8;
-}
type MatC8
    = MatC8


{-| typedef Eigen::Matrix<float,8,CPARS> Mat8Cf;
-}
type Mat8Cf
    = Mat8Cf


{-| typedef Eigen::Matrix<float,CPARS,8> MatC8f;
-}
type MatC8f
    = MatC8f


{-| typedef Eigen::Matrix<double,8+CPARS+1,8+CPARS+1> MatPCPC;
-}
type MatPCPC
    = MatPCPC


{-| typedef Eigen::Matrix<float,8+CPARS+1,8+CPARS+1> MatPCPCf;
-}
type MatPCPCf
    = MatPCPCf


{-| #define MatToDynamic(x) MatXX(x)
-}
type MatXX
    = MatXX
