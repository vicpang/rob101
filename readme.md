# description
    1. this repo contains tutorials for basic slam algorithm.
     All material are from the course Robot Mapping taught by Professor Cyrill Stachniss.
      Check out his lecture on youtube!
    2. code is originally running in octave, but adapted to run in matlab 

# odemotry model 
    0. command for generating video:
        `ffmpeg  -i odom_%03d.png out.avi`

    1. representation
    - landmark are represented by (id,x,y).
      In matlab, it is a vector, and landmarks is a struct of such vectors. 
    
    - observation data and odometry data are structure into time stamps.
      Timestamp is a 1xN struct array, on each time stamp, it has two field, sensor and odometry. 
      Each sensor and odometry are again struct
    
    - Odometry: 1x1 a struct with three fields, r1, t, r2, corresponding to model 
    
    - sensor: 1xN struct since at one time, there may be several landmarks seen. 
      Sensor has three fields: (id, range, bearing) which corresponds the sensor model
    - state x: vector of length 3: (x,y,theta)
    
    - careful: normalize theta everytime it is changed

    2. the odometry model 
    - odometry model is how state changes if we only consider odometry information. 
    Thus we update robot state x by iteratively update entries using the odometry formula

# ekf slam 

# uscented transform
    1. main flow
        we first define a gaussian distribution, then compute lambda
        then compute sigma points corresponding to mu and sigma
        then transform sigma points 
        finally recover mu and sigma
    Also plot original distribution with sampled data VS transformed distribution and transformed sigma data for comparison
   
    2. compute sigma point
        there are 2n*1 sigma points, first one is mu
        from 1:n, it's mu+addTerm, from n+1:2n, it's mu-addTerm
        compute weights: 
            compute mu's weight separately
            compute all other weights using formula
    note:sqrtm() returns principal squre root of matrix, one can use chol for Cholesky decomposition 

    3. transform
        there are already some functions implemented inside, choose one. usually this should be your odometry model
    
    4. recover gaussian
        compute mu and sigma
        use bscfun() to apply operation element-wise

    5. change parameters such as alpha, number of sigma points, see how they affect result

# ukf slam
    1. main flow
        the algorithm is divided into two steps as usual, prediciton and correction
        For initialization, mu is zero, sigma is near zero, and a scalar for computer lambda

    2. prediction step
        Purpose: take current mu, sigma and odometry, predict mu and sigma for the next state
        Steps:
            (1) compute sigma points
            (2) transform using odometry model, rememer to normalize angle
            (3) compute weights
            (4) recover mu
            (5) recover sigma and ADD NOISE