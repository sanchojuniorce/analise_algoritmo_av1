ARQUIVO_ENTRADA = 'C:\Users\junio\Desktop\aaflf\arquivo_entrada_aa_av1.txt'
ARQUIVO_SAIDA = 'C:\Users\junio\Desktop\aaflf\arquivo_saida_aa_av1.txt'

def ler_arquivo_entrada
	array_arquivo = []
	
	IO.foreach(ARQUIVO_ENTRADA) do |linha|
		#seperando os valores da string do arquivo de entrada
		linha_atual = linha.split(" ")
		# mapeando os valores do array e convertendo de string para inteiro
		valor_array_inteiro = linha_atual.map {|x| x.to_i }
		#injentando valores no array
		array_arquivo.push(valor_array_inteiro)
	end
	#removendo array do array
	array_arquivo = array_arquivo.pop.sort
end

def escreve_arquivo_saida
	#criando arquivo para escrever a saída
	arquivo_saida = File.new(ARQUIVO_SAIDA, "w")
	#escrevendo no arquivo
	arquivo_saida.puts(array_arquivo)
	#fechando o arquivo
	arquivo_saida.close
end	

def insertion_sort
	#laço para interar com intervalo de 1 ao tamanho do array do arquivo
	for i in 1...ler_arquivo_entrada.size
		chave = ler_arquivo_entrada[i]
		k = i
		while k > 0 and chave < ler_arquivo_entrada[k - 1]
			ler_arquivo_entrada[k] = ler_arquivo_entrada[k - 1]
			k -= 1
		end
		ler_arquivo_entrada[k] = chave			
	end	
	ler_arquivo_entrada
end


def merge_sort(array)
    if array.count <= 1
        return array
    end

    # aplicar divisão e conquista

    # Divisão
    metade_array = array.count / 2
    lado_esquerdo = merge_sort array.slice(0, metade_array)
    lado_direito = merge_sort array.slice(metade_array, array.count - metade_array)

    # Conquista
    array = []
    array_esquerdo = 0
    array_direito = 0
    while array_esquerdo < lado_esquerdo.count && array_direito < lado_direito.count
        a = lado_esquerdo[array_esquerdo]
        b = lado_direito[array_direito]

        # Pega o menor dos arrays e injeta o valor no array
        if a <= b
            array << a
            array_esquerdo += 1
        else
            array << b
            array_direito += 1
        end
    end

    # There is at least one element left in either part_a or part_b (not both)
    while array_esquerdo < lado_esquerdo.count
        array << lado_esquerdo[array_esquerdo]
        array_esquerdo += 1
    end

    while array_direito < lado_direito.count
        array << lado_direito[array_direito]
        array_direito += 1
    end

    return array
end

def selection_sort
	for i in 1...ler_arquivo_entrada.size
		menor = i
		
		for j in i+1...ler_arquivo_entrada.size	
			
			if ler_arquivo_entrada[j] < ler_arquivo_entrada[menor]
				menor = j
				
				if ler_arquivo_entrada[i] != ler_arquivo_entrada[menor]
					aux = ler_arquivo_entrada[i]
					ler_arquivo_entrada[i] = ler_arquivo_entrada[menor]
					ler_arquivo_entrada[menor] = aux
				end
			end
		end		
	end
	ler_arquivo_entrada
end		

puts'-------------------------------------------'
puts'------------Insertion-Sort-----------------'
puts insertion_sort()
puts'-------------------------------------------'
puts'------------Merge-Sort-----------------'
puts merge_sort(ler_arquivo_entrada)
puts'-------------------------------------------'
puts'------------Selection-Sort-----------------'
puts selection_sort()