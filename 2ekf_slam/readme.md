# EKF slam

## algorithm overview
    1. EKF slam is to use the extended kalman filter to solve the slam problem
    2. Extended because it is using taylor expansion to deal with the non-linear odometry and sensor model.
    3. The basic flow is not changed, that is, estimate miu and sigma based on odometry, then use observation for correction.

## initialization
    1. mu is a 2N+3 vector, initialized as 0, sigma can be divided into four block, where the lower right big block is initialized as InF
    2. for data association, we keep an observed_landmark vector of length N

## prediction step
    1. purpose of prediction step is to compute prediction of new state from previous state and current command.
    2. for miu , we simply use odometry model, and lift it to 2N+3 dimension by left multiplying Fx(a lifting matrix). For linearization, we compute Jaccobian for approximation, also need dim lifting.  For sigma, don't forget to add noise
    
## correction step
    1. purpose of correction step is to use observation correction 
    2. if a landmark has not been seen before, initialize it using the first observation, thus there is no correction step
    3. next we use predicted mean to estimate landmark position using the sensor model. A matrix Hi is used to linearize the model. It is a sparse and wide matrix and also needs dim lifting. The final H will be a stack of Hi. From there we compute kalman gain and the final corrected state.
    4. whenever a new angle is computed, always normalize it.

## observation  
    the covariance and information matrix is also ploted, we see how observing a landmark updates both matrix, and also information matrix is more diagonal!
    