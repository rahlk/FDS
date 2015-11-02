import math
import random

from time import strftime


max_point_value = 100
min_point_value = -100


def random_generator():
    return random.random()


def neigh(x, xmax=1e+5, xmin=-1e-5):
    rad = min(x-xmin, xmax-x)
    return random.uniform(x-rad, x+rad)


def normalize(f1, f2):
    return ((f1+f2) - min_point_value)/(max_point_value - min_point_value)


def denormalize(val):
    return (max_point_value-min_point_value)*val + min_point_value


def schaffer_func(x, normal=False):
    f1 = x ** 2
    f2 = (x-2) ** 2
    if normal:
        return normalize(f1, f2)
    else:
        return f1+f2


def get_minmax():
    global min_point_value
    global max_point_value
    for _ in range(100):
        x = random_generator()
        val = schaffer_func(x)

        if min_point_value > val:
            min_point_value = val

        if max_point_value < val:
            max_point_value = val


def prob_func(energy_init, energy_neigh, t):
    return math.e**((energy_init - energy_neigh)/t)


def simulated_annealing():
    # Setting the initial State
    state_best = state_initial = random.uniform(-10e-5,10e5)

    # Setting the initial Energy with normalized value
    energy_best = energy_initial = schaffer_func(state_initial, normal=True)

    print "########Code 4- Simulated Annealing on Schaffer ###############"
    print "#" + strftime("%Y-%m-%d %H:%M:%S")
    print "# Basic Study"
    print "\nSchaffer\n"

    # Energy Evaluation Count
    k = 1.0

    # Max Count
    k_max = 1000.0

    energy_max = 0
    # Output to be produced
    output = []

    # While Time remains but not good enough
    while k < k_max and energy_initial > energy_max:
        # Picking some random neighbours
        state_neighbour = neigh(state_initial)

        # Computation of neighbours energy
        energy_neighbour = schaffer_func(state_neighbour, True)

        # If it is new best, save it
        if energy_neighbour < energy_best:
            energy_best, state_best = energy_neighbour, state_neighbour
            output.append("!")
        # Jump to better
        elif energy_neighbour < energy_initial:
            state_initial, energy_initial = state_neighbour, energy_neighbour
            output.append("+")
        # Jump to worse
        elif prob_func(energy_initial, energy_neighbour,
                       (k/k_max)*0.6) < random_generator():
            state_initial, energy_initial = state_neighbour, energy_neighbour
            output.append("?")
        else:
            output.append(".")

        k += 1

        # Printing the result
        if k % 25 == 0:
            print "%04d," % (int(k-25)),
            print " | ",
            print "%04f" % denormalize(energy_best),
            print " | ",
            print "?=%02d" % output.count("?"), "!=", output.count("!"),
            print " | ",
            print "".join(output)
            output = []
    return state_best

get_minmax()
best_solution = simulated_annealing()
print "Best Solution: ", best_solution
print "kmax: 1000    baseline: 100"
print "Cooling Gradient: 0.6"