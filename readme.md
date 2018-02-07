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


