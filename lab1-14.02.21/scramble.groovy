@Grab('commons-collections:commons-collections:3.2.1')
import static org.apache.commons.collections.CollectionUtils.*

List<String> code = this.args[0].toCharArray().collect { it.toString().toBoolean() }
def polynomial = { x, y, z = null -> if (z) x ^ y ^ z else x ^ y }
def scramble = { arr, a, b ->
    arr.withIndex().collect { el, i ->
        if (i in 3..b - 1) polynomial(el, code[i - a])
        else if (i >= b) polynomial(el, code[i - a], code[i - b])
        else el
    }}
def toReadable = { [(it.collect { n -> n ? 1 : 0 }.join()): disjunction(code, it).size()] }
println([[3, 5], [5, 7]]
        .collect { scramble(code, it[0], it[1]) }
        .collectEntries { toReadable it  })