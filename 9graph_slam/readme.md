# graph slam

## data structure
    1. the graph information is computed from the frontend, then we have a struct g:{x,edge,id}
        x: position of (x,y), look up using landmark id or pose id, and has a predefined configuration
        edges:
            type:  Pose or Landmark. 
            from,to: node name
            measurement,information: gaussian assumption, mu and sigma
            fromidx,toidx: node index used to look up position
        idLookup:struct {field, value}
            field is node id, it can be pose of robot, or landmark
            value can be 2-dim or 3-dim, value also contains offset
    2. v2t: every pose vector corresponds to a transformation matrix in homogeneous coordinates
        t2v: every transformation also corresponds a 3-d vector, if it is a landmark, append a 0
    all error computation should be based on transformation matrix

## algorithm
    1 compute global error
    init global error as 0, loop over all edges:
        (pose-pose constraints)
        get two node pose from edge index
        compute error using transformation and transform back to vector
        weight error using information matrix, add to total error
    
        (pose-landmark constraint)
        get pose and landmark from edge index
        transform everything into transformation and compute error
        weight and add to total error
    2 loop
        iterate until converge:
            solve linear system and get update dx
            g.x=g.x+dx
            compute max(abs(dx)) and see if converged
    3 solving the system
        init H and b using number of non-zeros in the graph: spalloc()
        iterate over all edges:
            (pose pose)
            first get two poses
            compute linearization : error and jacobian of error
            comopute b, H and update
            add prior for H if haven't yet
            (pose landmark)
            get pose and landmakr
            compute linearazation: error and jacobian
            update b and H
        finally 
            dx=-H\b
    4 computing jacobian:
        in essence, compute A and B according to formula

