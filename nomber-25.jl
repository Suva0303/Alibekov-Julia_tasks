using HorizonSideRobots 
 
# 25. Написать рекурсивную функцию, перемещающую робота в заданном направлении до упора и расставлящую маркеры в шахматном порядке, 
# a) начиная с установки маркера;
# б) начиная без установки маркера (в стартовой клетке)

function mark_chess_rec!(r::Robot, side::HorizonSide, to_mark = true)
    if to_mark
        putmarker!(r)
    end

    if !isborder(r, side)
        move!(r, side)
        to_mark = !to_mark
        mark_chess_rec!(r, side, to_mark)
    end
end

#а 
function mark_chess_pos!(r::Robot, side::HorizonSide)
    mark_chess_rec!(r, side)
end
#б

function mark_chess_negative!(r)
    mark_chess_rec!(r, side, false)
end