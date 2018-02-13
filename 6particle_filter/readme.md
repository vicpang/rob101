# particle filter

## algorithm overview
    1. particle filter is a non-parameteric sampling based approach for approximating a distribution. usually this distribution is not known, but we have some observations to it. 
    2. Here we directly see the application of localization using particle filter
    3. There is a prediction step and resampling step 

## data representation
    1. each particle is a struct. with its weight, current pose and history. history is again an array of particle cells. see pic1 in obs folder. for initialization, weights are 1/(#particles).

## prediction step
    1. this step draws samples from the odometry model, in implementation, we just transform all the particles according to the odometry model
    2. after translation, we use gaussian random sampler normrnd() to sample from a gaussian where mean and variance is specified by that particle.
    3. it is important that we sample again, rather than using the translated particle directly.

## resampling step  
    1. this step resamples the particles according to the weights, weights are specified by our observation of the world
    2. here we did not use observation, but simply weighted by their distance from origin
    3. inside the resampling step, the most important is the low-varaince sampling algorithms, which is well implemented
    4. pic2 in obs folder shows an example of resampling.
    5. we will see the whole algorithm in fastslam
    6. comparing the two clips in plots folder we see how resampling helps to converge
## summary
    1. particle filter involves two steps, prediction and resampling. in prediction, we use odometry model and sample from translated gaussian, in resampling step, we compute weights using observation and resampling using the low varaince resampling algorithm.
    2. particle filter can be used to solve localization as well as slam problem