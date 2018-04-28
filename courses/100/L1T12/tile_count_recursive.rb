M = 'land'
o = 'water'

world = [[o,o,o,o,o,o,o,o,o,o,o],
        [o,o,o,o,M,M,o,o,o,o,o],
        [o,o,o,o,o,o,o,o,M,M,o],
        [o,o,o,M,o,o,o,o,o,M,o],
        [o,o,o,M,o,M,M,o,o,o,o],
        [o,o,o,o,M,M,M,M,o,o,o],
        [o,o,o,M,M,M,M,M,M,M,o],
        [o,o,o,M,M,o,M,M,M,o,o],
        [o,o,M,o,o,o,M,M,o,o,o],
        [M,M,o,o,o,M,o,o,o,o,o],
        [o,o,o,o,o,o,o,o,o,o,o]]

def continent_size world, x, y
  sum = 0

  #If current tile is not 'land', don't count. Immediately return 0.
  #If trying to access tile outside of boundary, also return 0 to stop recursion.
  if (world[x][y]!='land' || x<0 || y<0 || x>world.length || y>world[x].length)
    return 0
  else
  #If current tile is 'land', count current tile & mark as counted. 
  #Then recursively count neighbors
    sum+=1
    world[x][y] = 'counted_land'

    sum += continent_size(world,x+1,y)
    sum += continent_size(world,x+1,y+1)
    sum += continent_size(world,x,y+1)
    sum += continent_size(world,x-1,y+1)
    sum += continent_size(world,x-1,y)
    sum += continent_size(world,x-1,y-1)
    sum += continent_size(world,x,y-1)
    sum += continent_size(world,x+1,y-1)
  end
      
  return sum
end

puts continent_size(world,5,5)