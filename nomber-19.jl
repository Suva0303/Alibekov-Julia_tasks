using HorizonSideRobots 
# №19 рекусивная функция которая переместит робота до упора, ставящая возле перегородки маркер и возвращающий в исхожное место 

function putmarker_at_border_and_back_recusive!(robot::Robot, side::HorizonSide, n_steps::Int = 0)
    if !isborder(r, side)
        move!(r, side)
        n_steps += 1
        putmarker_at_border_and_back_recusive!(r, side, n_steps)
    else
        putmarker!(r)
        along!(robot, inverse_side(side), n_steps)
    end
end

function inverse_side(side::HorizonSide)::HorizonSide
    inv_side = HorizonSide((Int(side) + 2) % 4)
    return inv_side
end

function along!(robot, side, num_steps)
    n_steps = 0
    while !isborder(robot, side) && n_steps < num_steps
        move!(robot, side)
        n_steps += 1
    end
end

# along!(robot, side, num_steps)` 
-- перемещает робота (какого-либо типа) в заданном направлении на заданное число шагов