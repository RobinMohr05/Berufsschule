import numpy


class neuralNetwork:
    def __init__(self, inputnodes, hiddennodes, outputnodes, lerningrate) -> None:
        self.inputnodes = inputnodes
        self.hiddennodes = hiddennodes
        self.outputnodes = outputnodes
        self.lerningrate = lerningrate

        self.weight_inputnodes_hiddennodes = numpy.random.normal(0.0,pow(self.inputnodes, -0.5), (self.hiddennodes, self.inputnodes))
        self.weight_hiddennodes_outputnodes = numpy.random.normal(0.0,pow(self.hiddennodes, -0.5), (self.outputnodes, self.hiddennodes))

    def train(self):
        print("I am training")

    def query(self):
        print("i ask")


input_nodes = 3
hidden_nodes = 3
output_nodes = 3

learning_rate = 0.4

n = neuralNetwork(input_nodes, hidden_nodes, output_nodes, learning_rate)

input_list=[(1.0, 0.5, 0.3), (0.4, 0.9, 0.1)]
target_list=[(1.0, 0.0, 0.0), (0.0, 1.0, 0.0)]
n.train(input_list, target_list)

output=n.query([1.0, 0.5, -1.5])
print("Queryoutput:")
print(output)