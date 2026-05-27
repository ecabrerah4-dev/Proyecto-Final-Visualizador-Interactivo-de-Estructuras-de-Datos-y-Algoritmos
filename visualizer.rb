class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red; colorize(31); end
  def green; colorize(32); end
  def yellow; colorize(33); end
  def blue; colorize(34); end
  def magenta; colorize(35); end
  def cyan; colorize(36); end
end


class SinglyLinkedList
  Node = Struct.new(:value, :next)

  def initialize
    @head = nil
  end

  def insert_head(value)
    node = Node.new(value, @head)
    @head = node
  end

  def insert_tail(value)
    node = Node.new(value, nil)
    if @head.nil?
      @head = node
    else
      current = @head
      current = current.next while current.next
      current.next = node
    end
  end

  def delete(value)
    return false if @head.nil?
    if @head.value == value
      @head = @head.next
      return true
    end
    current = @head
    while current.next && current.next.value != value
      current = current.next
    end
    if current.next
      current.next = current.next.next
      true
    else
      false
    end
  end

  def search(value)
    current = @head
    index = 0
    while current
      return index if current.value == value
      current = current.next
      index += 1
    end
    nil
  end

  def to_s
    return "vacía".yellow if @head.nil?
    elements = []
    current = @head
    while current
      elements << current.value.to_s.cyan
      current = current.next
    end
    elements.join(" → ")
  end
end

# ------------------------------------------------------------
# Lista Doblemente Enlazada
# ------------------------------------------------------------
class DoublyLinkedList
  Node = Struct.new(:value, :prev, :next)

  def initialize
    @head = nil
    @tail = nil
  end

  def insert_head(value)
    node = Node.new(value, nil, @head)
    @head.prev = node if @head
    @head = node
    @tail = node if @tail.nil?
  end

  def insert_tail(value)
    node = Node.new(value, @tail, nil)
    if @tail
      @tail.next = node
      @tail = node
    else
      @head = @tail = node
    end
  end

  def delete(value)
    current = @head
    while current
      if current.value == value
        if current.prev
          current.prev.next = current.next
        else
          @head = current.next
        end
        if current.next
          current.next.prev = current.prev
        else
          @tail = current.prev
        end
        return true
      end
      current = current.next
    end
    false
  end

  def search(value)
    current = @head
    index = 0
    while current
      return index if current.value == value
      current = current.next
      index += 1
    end
    nil
  end

  def to_s
    return "vacía".yellow if @head.nil?
    elements = []
    current = @head
    while current
      elements << current.value.to_s.magenta
      current = current.next
    end
    elements.join(" ⇄ ")
  end
end

# ------------------------------------------------------------
# Pila (Stack)
# ------------------------------------------------------------
class Stack
  def initialize
    @items = []
  end

  def push(value)
    @items.push(value)
  end

  def pop
    @items.pop
  end

  def peek
    @items.last
  end

  def empty?
    @items.empty?
  end

  def to_s
    return "vacía".yellow if empty?
    "🔝 #{@items.reverse.join(' ↓ ')} 🔝"
  end
end

# ------------------------------------------------------------
# Algoritmos de ordenamiento (con pasos)
# ------------------------------------------------------------
class SortingVisualizer
  attr_reader :steps

  def merge_sort(arr, depth = 0)
    return arr if arr.length <= 1
    mid = arr.length / 2
    left = merge_sort(arr[0...mid], depth + 1)
    right = merge_sort(arr[mid..-1], depth + 1)
    merge(left, right)
  end

  def merge(left, right)
    result = []
    until left.empty? || right.empty?
      result << (left.first <= right.first ? left.shift : right.shift)
    end
    result + left + right
  end

  def quick_sort(arr)
    return arr if arr.length <= 1
    pivot = arr.last
    left = arr[0...-1].select { |x| x <= pivot }
    right = arr[0...-1].select { |x| x > pivot }
    quick_sort(left) + [pivot] + quick_sort(right)
  end

  def run_merge_demo(arr)
    puts "\n📊 Merge Sort sobre #{arr}:".blue
    sorted = merge_sort(arr.dup)
    puts "Entrada: #{arr.join(', ')}".yellow
    puts "Salida : #{sorted.join(', ')}".green
    puts "Complejidad: O(n log n) estable".cyan
  end

  def run_quick_demo(arr)
    puts "\n⚡ Quick Sort sobre #{arr}:".blue
    sorted = quick_sort(arr.dup)
    puts "Entrada: #{arr.join(', ')}".yellow
    puts "Salida : #{sorted.join(', ')}".green
    puts "Complejidad: O(n log n) promedio, O(n²) peor caso".cyan
  end
end

# ------------------------------------------------------------
# Menú interactivo en consola
# ------------------------------------------------------------
def run_console_demo
  puts "\n" + "═" * 60
  puts "🌟 VISUALIZADOR DE ESTRUCTURAS DE DATOS Y ALGORITMOS (RUBY)".center(60).green
  puts "═" * 60

  # Lista enlazada simple
  sll = SinglyLinkedList.new
  [10, 20, 30].each { |v| sll.insert_tail(v) }
  puts "\n🔗 Lista Enlazada Simple (inicial): #{sll}"
  sll.insert_head(5)
  puts "   Insertar 5 al inicio: #{sll}"
  sll.insert_tail(40)
  puts "   Insertar 40 al final: #{sll}"
  sll.delete(20)
  puts "   Eliminar 20: #{sll}"
  puts "   Buscar 30: posición #{sll.search(30) || 'no encontrada'}"

  # Lista doblemente enlazada
  dll = DoublyLinkedList.new
  [1, 2, 3].each { |v| dll.insert_tail(v) }
  puts "\n🔄 Lista Doblemente Enlazada: #{dll}"
  dll.insert_head(0)
  puts "   Insertar 0 al inicio: #{dll}"
  dll.delete(2)
  puts "   Eliminar 2: #{dll}"

  # Pila
  stack = Stack.new
  %w[A B C].each { |v| stack.push(v) }
  puts "\n📚 Pila (Stack): #{stack}"
  stack.push('D')
  puts "   Push D → #{stack}"
  popped = stack.pop
  puts "   Pop → '#{popped}', ahora: #{stack}"
  puts "   Tope actual: #{stack.peek || 'ninguno'}"

  # Algoritmos
  sorter = SortingVisualizer.new
  test_array = [12, 5, 8, 3, 9, 1, 7, 4]
  sorter.run_merge_demo(test_array)
  sorter.run_quick_demo(test_array)

  puts "\n" + "═" * 60
  puts "✅ Demostración completa. Todas las estructuras y algoritmos funcionan en Ruby."
  puts "═" * 60
end

# Ejecutar solo si se llama directamente al script
run_console_demo if __FILE__ == $PROGRAM_NAME