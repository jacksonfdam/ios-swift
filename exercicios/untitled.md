
## 1. Variáveis

### Declarando variáveis

Em Swift, nos usamos a palavra-chave  `var`  para declarar variáveis. Apesar de ser semelhante a forma como as variáveis são declaradas em outras linguagens de programação, aconselho fortemente a não pensar em outras linguagens de programação quando usamos a palavra-chave  `var`  em Swift. Existem algumas diferenças importantes.

A palavra-chave  `var`  é a única maneira de declarar uma variável em Swift. A mais comum e concisa forma de utilizar o  `var`  é declarar uma variável e atribuir um valor a ela.

```swift
var street = "5th Avenue"
```

Lembre-se que nós não terminamos esta linha de código com um ponto e vírgula. Apesar de o ponto e vírgula ser opcional em Swift, a melhor prática é não usar o ponto e vírgula se não for necessário.

Você também deve ter notado que não especificamos um tipo quando declaramos a variável `street`. Isso nos leva a uma característica chave de Swift, inferência de tipo.

### Inferência de tipo

Na instrução acima declaramos a variável  `street`  e atribuímos o valor  `5th Avenue`  para ela. Se você é novo em Swift ou você já usou JavaScript ou PHP, você pode estar pensando que o Swift é sem tipagem ou uma linguagem fracamente tipada, mas isso está longe da verdade. Deixe-me relembrar que Swift é uma  **linguagem fortemente tipada.**  **Segurança de tipo** é um dos pilares da linguagem.

Nós estamos apenas começando e Swift já nos mostra um pouco de sua magia. Mesmo que a declaração acima não especifique explicitamente um tipo, a variável de  `street`  é do tipo  `String`. Esta é a inferência de tipo do Swift em ação. O valor que atribuímos a  `street`  é uma string. Swift é inteligente o suficiente para ver e implicitamente definir o tipo  `String`  para a variável `street`.

A instrução a seguir nos dá o mesmo resultado. A diferença é que nos explicitamente definimos o tipo da variável. A instrução abaixo literalmente informa que  `street`  _é do tip_o  `String`

```swift
var street: String = "5th Avenue"
```

O Swift requer que você explicitamente ou implicitamente defina o tipo das variáveis ou constantes. Se você não fizer, o Swift irá informar que há um erro. Adicione a seguinte linha no seu playground, para você ver o que quero dizer.

```swift
var number
```

Esta instrução seria perfeitamente valida em PHP ou em JavaScript. Em Swift, porém, ela não é valida. A razão é simples. Mesmo que declaramos uma variável usando a palavra-chave  `var`, não especificamos o tipo da variável. O Swift é incapaz de inferir o tipo se nós não atribuirmos um valor à variável. Se você clicar no erro, o Xcode irá te falar qual é a instrução errada.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/22828/image/figure-error-no-type.jpg)

Você pode facilmente corrigir este erro, fazendo uma das duas coisas. Nós podemos atribuir um valor para a variável como fizemos anteriormente ou podemos explicitamente atribuir um tipo para a variável  `number`. Definindo explicitamente o tipo para  `number`, e o erro desaparece. A linha de código abaixo define que `number`  é do tipo  `String`.

```swift
var number: String
```

### Mudando o tipo

Como você pode ver abaixo, atribuir novos valores para a  `street`  e  `number`  é simples e sem surpresas.

```swift
var street: String = "5th Avenue"

var number: String

street = "Main Street"

number = "10"
```

Não seria mais fácil atribuir o número  `10`  para a variável  `number`. Não há nenhuma necessidade de armazenar o número da rua como uma string. Vamos ver o que acontece se fizermos.

```swift
`var` `street: String =` `"5th Avenue"`

`var` `number: String`

`street =` `"Main Street"`

`number = 10`
```

Se tentarmos atribuir um número inteiro a  `number`, o Xcode mostrará outro erro para nós. Infelizmente, desta vez a mensagem de erro não é muito útil. A razão pela qual o Xcode informa um erro é que tentamos atribuir um número inteiro para uma variável do tipo  `String`. Isto não é um problema em linguagens fracamente tipada, mas é em Swift.

O Swift é uma linguagem fortemente tipada em que cada variável tem um tipo específico e o tipo não pode ser alterado. Leia esta frase novamente, porque este é um conceito importante em Swift.

Para se livrar do erro, precisamos declarar a variável  `number`  como  `Int`. Dê uma olhada no exemplo abaixo.

```swift
`var` `street: String =` `"5th Avenue"`

`var` `number: Int`

`street =` `"Main Street"`

`number = 10`
```

### Resumo

É importante que você mantenha o seguinte em mente. Você pode declarar uma variável com a palavra-chave  `var` mas não precisa declarar de formar explicita o tipo da variável. Porém, lembre-se que toda variável - e constante - deve ter um tipo em Swift. Se o Swift não pode inferir o tipo, então ele vai reclamar. Toda variável tem um tipo e este tipo não pode ser mudado.

## 2. Constantes

Constantes são similares as variáveis em termos de tipagem. A unica diferença é que o valor de uma constante não pode ser alterado uma vez que seja atribuído um valor a ela. O valor de uma constante é ... bem ... constante.

### Declarando constantes

Para declarar uma constante, você usa a palavra-chave `let`. Dê uma olhada no seguinte exemplo em que nós declaramos  `street`  como uma constante em vez de uma variável.

```swift
`let` `street: String =` `"5th Avenue"`

`var` `number: Int`

`street =` `"Main Street"`

`number = 10`
```

Se alterarmos apenas a primeira linha, substituindo  `var`  por  `let`, o Xcode retornar um erro por razões obvias. Tentar mudar o valor de uma constante não é permitido em Swift. Remova ou comente a linha em que nos tentamos atribuir um novo valor para  `street`  para se livrar do erro.

### Usando constantes

Eu espero que você concorde que declarar constantes é muito fácil em Swift. Não é necessário nenhuma palavra-chave exótica ou uma sintaxe complexa. Declarar constantes é tão fácil quanto declarar variáveis e isto não é uma coincidência.

O uso de constantes é encorajado em Swift. Se um valor não vai mudar ou você não espera que mude, então deve ser uma constante. Isto tem uma série de benefícios. Um dos benefícios é a performance, mas o mais importante benefício é a segurança. Ao usar constantes sempre que possível, você adiciona restrições em seu código e o resultado é um código seguro.

## 3. Tipos de dados

A maioria das linguagens de programação têm uma ampla gama de tipos para armazenar strings, inteiros, floats, etc. Os tipos disponíveis em Swift são limitados. Dê uma olhada na lista a seguir.

-   `Int`
-   `Float`
-   `Double`
-   `String`
-   `Character`
-   `Bool`

É importante entender que os tipos acima não são tipos básicos ou primitivos. Eles são chamados de tipos, que são implementados por Swift usando estruturas. Iremos explorar estruturas com mais detalhes posteriormente nesta série, mas é bom saber que o que vimos até agora não são como os tipos primitivos, que você pode ter usado em, por exemplo, Objective-C.

Existem muitos outros tipos de dados em Swift, tais como tuplas, arrays e dicionários, e vamos explora-los um pouco mais tarde nesta série.

## 4. Conversão de tipo

Há mais um tema que precisamos discutir, conversão de tipo. Dê uma olhada no seguinte trecho de Objective-C. Este bloco de código imprimirá o valor  `314.000000`  no console.

```swift
`int` `a =` `1``0``0``;`

`float` `b =` `3``.14``;`

`NSLog(``@"%f"``, (``a` `* b));`
```


O Objective-C converte implicitamente em tempo de execução a variável  `a`  para um valor em ponto flutuante e multiplica com  `b`. Vamos reescrever o trecho de código acima usando Swift.

```swift
`var` `a = 100`

`var` `b = 3.14`

`println(a * b)`
```

Ignore a função  `println`  por enquanto. Primeiro quero focar a multiplicação de  `a`  e  `b`. O Swift inferirá o tipo de  `a`, um  `Int`  e  `b`, um  `Double`. No entanto, quando ele tenta multiplicar  `a`  e  `b`, ele percebe que não são do mesmo tipo. Isto pode não parecer um problema para você, mas é para o Swift. O Swift não sabe qual tipo deve ser o resultado desta multiplicação. Deve ser um número inteiro ou um double.

Para corrigir esse problema, precisamos ter certeza de que ambos os operandos da multiplicação são do mesmo tipo, porque o Swift não converte implicitamente os operandos para nós. Há uma série de funções auxiliares globalmente disponíveis que faz esta tarefa trivial. No exemplo atualizado abaixo, chamamos  `Double`  sobre a variável de  `a`  para converter seu valor para double. Isto resolve o erro.

```swift
`var` `a = 100`

`var` `b = 3.14`

`println(Double(a) * b)`
```

Observe que o tipo de  `a`  não mudou. Mesmo que o trecho de código acima possa parecer do tipo casting, não é a mesma coisa. A função  `Double`  pega o valor de  `a`, retorna o valor como um  `Double`  e o resultado é usado na multiplicação com  `b`. O resultado é do tipo  `Double`.

O que você precisa se lembrar é que Swift é diferente de C e Objective-C. Ela não converte implicitamente os valores das variáveis e constantes. Este é outro conceito importante a entender.

## 5. Linha de impressão

No trecho de código anterior, nós invocarmos nossa primeira função,  `println`. A função  `println`  é muito similar a  `NSLog`  do Objective-C, ela imprime algo e acrescenta uma nova linha. A biblioteca padrão da Swift também inclui uma função de `print`, que faz a mesma coisa que a função `println`, mas não acrescentar uma nova linha.

Para imprimir alguma coisa, basta invocar  `println`  e passar um parâmetro. Que pode ser uma variável, uma constante, uma expressão ou uma literal. Dê uma olhada nos exemplos a seguir.

```swift
`var` `string =` `"this is a string"`

`let` `constant = 3.14`

`println(string)`

`println(constant)`

`println(10 * 50)`

`println(``"string literal"``)`
```

Também é possível usar interpolação de string para combinar variáveis, constantes, expressões e literais. Interpolação de strings é muito fácil em Swift, basta inserir as variáveis, constantes, expressões ou literais em  `\()`. Fácil como uma torta.

```swift
`let` `street =` `"5th Avenue"`

`let` `number = 10`

`println(``"She lives at \(street) \(number)."``)`

```

## 1. Arrays

Se você estiver familiarizado com Objective-C, JavaScript ou PHP, você não vai ter dificuldades para colocar em sua cabeça o conceito de arrays. Um array é um ordenado, uma coleção com indice zero de valores. Há, no entanto, algumas diferenças importantes.

### Tipo

A primeira diferença importante com os arrays de Objective-C é que os valores armazenados em um array é sempre do mesmo tipo. A princípio, isto pode parecer como uma limitação significativa, mas na verdade não é. Na verdade, essa limitação tem uma vantagem importante. Nós sabemos exatamente que tipo irá retornar quando pedirmos ao array por um dos seus valores.

Outra diferença importante com os arrays de Objective-C é o tipo dos valores que um array pode armazenar. Em Objective-C, um array só pode armazenar valores de um tipo classe. O Swift não tem essa limitação. Um array em Swift pode armazenar strings, inteiros, decimais e instâncias de classes. Como isso funciona e por que isso é possível em Swift ficará claro mais tarde nesta série, quando abordamos sobre classes e estruturas.

### Declaração

A criação de um array pode ser feito de várias maneiras, você so precisa ter em mente que o Swift precisa saber que tipo de valor você deseja armazenar no array. Crie um novo playground no Xcode, como fizemos no  [artigo anterior](http://code.tutsplus.com/tutorials/swift-from-scratch-variables-and-constants--cms-22828)  e adicione as seguintes linhas ao seu playground.

```swift
`var` `array1: Array<String>`

`var` `array2: [String]`

`var` `array3 = [``"Apple"``,` `"Pear"``,` `"Orange"``]`

```

A segunda linha é uma abreviação da primeira linha. Os colchetes envolvendo a palavra-chave  `String`  diz ao Swift que vamos declarar um array que só pode conter objetos do tipo  `String`.

Você poderia ler a primeira linha de código como "Declaramos uma variável chamada  `array1`  _do tipo_`Array`  que só pode conter objetos do tipo  `String`". Note que em itálico  _do tipo_ é o que significa os dois pontos.

A terceira linha mostra como inicializamos um array usando um array de literal. Array literais são muito similares ao array literais em Objective-C. A principal diferença é a ausência do símbolo `@` antes dos colchetes e as strings literais.

Há também uma maneira elegante para inicializar um array com um número predefinido de valores padrão. A sintaxe pode ser um pouco confusa de início, mas tire um minuto a mais para entendê-la.

```swift
`var` `a = [String](count: 5, repeatedValue:` `"Test"``)`
```

O array resultante contém cinco strings, cada string sendo igual a  `"Test"`. Para entender melhor a inicialização acima, dê uma olhada nas duas linhas de código a seguir em que inicializamos uma matriz de string vazia.

```swift
`var` `b = Array<String>()`

`var` `c = [String]()`
```

Não se preocupe se você ainda estiver confuso. Vamos explorar a sintaxe mais detalhadamente, uma vez que começarmos a lidar com classes e funções. Neste artigo, nós vamos nos focar apenas em coleções.

### Mutabilidade

Um aspecto de Swift que você rapidamente vai apreciar é como declarar coleções mutáveis. No trecho de código acima, por exemplo, declaramos três arrays mutáveis. Um array mutável é definido usando a palavra-chave  `var`. É tão simples. Se você não quer um array mutável, então use o  `let`. O Swift pretende ser intuitivo e fácil de usar e a implementação mutável em Swift é um exemplo perfeito dessa meta.

### Obter e definir valores

Para acessar os valores armazenados em um array, usamos a mesma sintaxe de Objective-C. No exemplo a seguir, pedimos ao `array3`  pelo seu segundo elemento, a string  `"pear"`.

```swift
`array3[1]`
```

Substituir o valor armazenado no índice  `1`  é tão simples como atribuir um novo valor usando a mesma sintaxe subscrita. No exemplo a seguir, podemos substituir  `"pear"`  no índice  `1`  por `"peach"`.

```swift
`array3[1] =` `"Peach"`
```

Isto só é possível porque o array é mutável, ou seja, usamos a palavra-chave  `var`  para declarar o array. Alterar um array constante, não é possível. Existem técnicas mais avançadas para manipular o conteúdo de um array, mas o conceito base é o mesmo.

Mesclar dois arrays é tão simples como adicioná-los juntos. No exemplo a seguir, podemos declarar e mesclar dois arrays imutáveis. Note que o array resultante,  `c`, não precisa ser mutável para que funcione.

```swift
`let` `a = [1, 2, 3]`

`let` `b = [4, 5, 6]`

`let` `c = a + b`
```

No entanto, é fundamental que os valores armazenados em  `a`  e  `b`  sejam do mesmo tipo. O motivo deve ser obvio. Os valores armazenados em um array precisam ser do mesmo tipo. O exemplo a seguir irá resultar em um erro.

```swift
`let` `a = [1, 2, 3]`

`let` `b = [1.5, 5.2, 6.3]`

`let` `c = a + b`
```

Para acrescentar um valor em um array mutável, usamos o operador  `+=`. Observe que o operando à direita é um array. Esta operação não funcionaria se removemos os colchetes em torno de  `4`.

```swift
`var` `a = [1, 2, 3]`

`a += [4]`
```

### Operações

Array são objetos nos quais você pode executar uma grande variedade de operações. Arrays dispõem de uma série de funções ou métodos. Para chamar um método em um objeto, você deve usar a notação de ponto. Adicione a seguinte linha ao seu playground para adicionar um item ao  `array3`.

```swift
`array3.append(``"Cherry"``)`
```

Vamos ver quantos itens contém no `array3` chamando seu método  `count`. Isso retorna `4`  no painel de resultados, à direita.

```swift
`array3.count`
```

Também é possível inserir um item em um índice específico, invocando o método de  `insert`  do array, conforme mostrado abaixo. O método `insert` aceita mais de um parâmetro e pode parecer um pouco estranho no começo.
```swift
`array3.insert(``"Prune"``, atIndex: 2)`
```

Como o Objective-C, o Swift suporta parâmetros nomeados para melhorar a legibilidade. O resultado é que o código fica mais fácil de ler e entender e funções ou métodos não precisam de muita explicação do que fazem. Fica claro, por exemplo, que o método  `insert`  insere um elemento no índice  `2`.

Embora Swift seja mais concisa e menos detalhada que Objective-C, ele também oferece suporte a parâmetros nomeados. Se você está vindo de PHP, Ruby ou JavaScript, então isso é certamente algo que terá que se acostumar a usar.

### Métodos convenientes

O que eu realmente gosto sobre Swift é a conveniência de Ruby, como propriedades e métodos da biblioteca padrão do Swift. Um array, por exemplo, tem uma propriedade  `isEmpty`  que informa se o array contém algum elemento. Isso nada mais é do que uma forma abreviada para verificar o retorno da função  `count` da matriz. O resultado, no entanto, é um código mais conciso e fácil de ler.

```swift
`array3.isEmpty`
```

## 2. Dicionários

Dicionários se comportam muito semelhante aos dicionários em Objective-C. Um dicionário armazena uma coleção não ordenada de valores. Cada valor no dicionário está associado a uma chave. Em outras palavras, um dicionário armazena um número de pares chave/valor.

### Tipo

Como os arrays, as chaves e os valores armazenados em um dicionário precisam ser do mesmo tipo. Isto significa que se você pergunta a um dicionário por um valor de uma chave em particular, você sabe que tipo o dicionário irá retornar.

### Declaração

Declarar um dicionário é semelhante a declarar um array. A diferença é que você precisa especificar o tipo para as chaves e os valores. O exemplo a seguir mostra três maneiras de declarar um dicionário.

```swift
`var` `dictionary1: Dictionary<String, Int>`

`var` `dictionary2: [String: Int]`

`var` `dictionary3 = [``"Apple"``: 3,` `"Pear"``: 8,` `"Orange"``: 11]`
```

A segunda linha é uma abreviação para a primeira linha. As chaves destes dicionários precisam ser do tipo  `String`, enquanto que os valores são do tipo  `Int`. A palavra-chave  `var`  indica que os dicionários são mutáveis.

Você poderia ler a primeira linha do código como "Nós declaramos uma variável chamada  `dictionary1`  _do tipo_  `Dictionary`  que pode conter apenas as chaves do tipo  `String`  e valores do tipo  `Int`."

A terceira linha ilustra como nós podemos inicializar um dicionário usando um dicionário literal. Isto é semelhante à sintaxe que nós usamos em Objective-C, mas note que as chaves são substituídas por colchetes e a literal não é iniciada com um símbolo  `@`.

### Obter e definir valores

Acessar valores é semelhante a acessar valores de um array. A unica diferença é que você usa a chave ao invés de usar o índice do valor que você precisa acessar. O exemplo abaixo demonstra isto.

```swift
`let` `value = dictionary3[``"Apple"``]`

`println(value)`
```

Você notará que o Xcode nos diz que o valor do  `value`  não é  `3`, mas  `Optional(3).`  O que isso significa? O Swift usa opcionais para empacotar valores que podem ser uma de duas coisas, um valor ou `nil`. Não se preocupe com opcionais neste ponto. Vamos focar em opcionais no próximo artigo desta série. Deixe-me dizer que opcionais são outro conceito-chave da linguagem Swift.

É interessante destacar que a sintaxe para acessar um dicionário é idêntica ao de um array, se as chaves do dicionário são do tipo  `Int`. Dê uma olhada no exemplo a seguir para ver o que quero dizer.

```swift
`var` `dictionary4 = [0:` `"Apple"``, 1:` `"Pear"``, 2:` `"Orange"``]`

`let` `fruit = dictionary4[0]`
```

### Operações

Como em arrays, a biblioteca do Swift define uma ampla gama de operações que você pode executar em dicionários. Um dicionário retorna o número de pares chave/valor chamando a função  `count`. Remover um par chave/valor é fácil e intuitivo, como o exemplo seguinte ilustra. Claro, que isso só é possível se o dicionário for mutável.

```swift
`dictionary4.removeValueForKey(0)`
```

Quando você começa a aprender Swift, ocasionalmente você se depara com trechos de código que vão parecer estranhos ou confusos. Dê uma olhada na linha a seguir, em que primeiro declara um dicionário e depois remove seus pares chave/valor.

```swift
`var` `dictionary = [String: Int]()`

`dictionary[``"Oranges"``] = 2`

`dictionary[``"Apples"``] = 10`

`dictionary[``"Pears"``] = 5`

`dictionary = [:]`
```

Você tem que admitir que a última linha parece um pouco estranha. Como o Swift sabe os tipos das chaves e valores que podem ser armazenados no `dictionary`, esvaziar o dicionário é tão simples como atribuir um dicionário vazio.

Não há nenhuma necessidade de especificar os tipos das chaves e valores neste caso, porque já fizemos quando declaramos o dicionário na primeira linha. Isso destaca outro detalhe importante, ou seja, o tipo de valores que você pode armazenar em arrays e dicionários não podem mudar uma vez que a coleção é declarada.

## 3. Tuplas

Você vai amar as tuplas. Apesar das tuplas não serem coleções, elas também agrupam múltiplos valores. Similares a arrays e dicionários, as tuplas podem conter valores de qualquer tipo. A principal diferença, no entanto, é que os valores armazenados em uma tupla não precisam ser do mesmo tipo. Vejamos um exemplo para explicar mais detalhadamente.

```swift
`var` `currency = (``"EUR"``, 0.81)`

`var` `time = (NSDate(),` `"This is my message."``)`

`var` `email = (``"Bart Jacobs"``,` `"bart@example.com"``)`
```

O primeiro exemplo declara uma tupla com o nome de  `currency` do tipo  `(String, Int)`. A segunda tupla, time, contem uma instância  `NSDate`  e uma string. Os valores armazenados em  `email`  são ambos do tipo  `String`, o que significa que  `email`  é do tipo  `(String, String)`.

### Acessando valores

#### Índices

Para acessar um valor armazenado em uma tupla, você usa o índice que corresponde ao valor que você tem interesse.

```swift
`var` `rate = currency.1`

`var` `message = time.1`

`var` `name = email.0`
```


O Xcode nos mostra os índices de cada valor armazenado em uma tupla no painel de resultados à direita do playground.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/22832/image/figure-tuples-indexes.jpg)

#### Nomes

Para melhorar a legibilidade, você pode nomear os valores armazenados em uma tupla. O resultado é que você pode acessar os valores da tupla através de seus nomes em vez de seus índices. Declarar uma tupla fica um pouco diferente nesse caso.

```swift
`var` `currency = (name:` `"EUR"``, rate: 0.81)`

`let` `currencyName = currency.name`

`let` `currencyRate = currency.rate`
```

### Decomposição

Há uma segunda forma mais elegante para trabalhar com os valores armazenados em uma tupla. Dê uma olhada em como decompomos o conteúdo da  `currency`  no exemplo a seguir.

```swift
`let` `(currencyName, currencyRate) = currency`
```

O valor da  `currency`  no índice  `0`  é armazenado em  `currencyName`  e o valor do índice  `1`  é armazenado em  `currencyRate`. Não há nenhuma necessidade de especificar o tipo para  `currencyName`  e  `currencyRate`  ja que o Swift infere o tipo dos valores armazenados em  `currency`. Em outras palavras,  `currencyName`  é do tipo  `String`  e  `currencyRate`  é do tipo  `Float`.

Se você só está interessado em um valor específico de uma tupla, você pode usar um caractere de sublinhado para dizer ao Swift quais os valores que você não está interessado.

```swift
`let` `(currencyName, _) = currency`
```

## Opcionais

Nós já vimos que uma variável deve ser inicializada antes que possa ser usada. Dê uma olhada no exemplo a seguir para entender melhor o que isso significa.

```swift
`var` `str: String`

`str.isEmpty`
```

Se você está acostumado a trabalhar com strings em Objective-C, então você ficará surpreso que o Swift nos retornará um erro. Vamos ver o que o erro nos informa.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/22874/image/figure-uninitialized-variable.jpg)

Em muitas linguagens, variáveis têm um valor padrão inicial. Em Objective-C, por exemplo, a string no seguinte trecho de código é igual  `nil`.

```swift
`NSString` `*newString;`
```

No entanto, o conceito do  `nil`  difere em Swift e Objective-C. Vamos discutir `nil`  com mais detalhes um pouco mais tarde.

### O que é um opcional?

Swift usa os opcionais para encapsular um conceito importante, isto é, uma variável ou constante tem um valor ou não tem. É simples assim em Swift. Para declarar uma variável ou constante como opcional, acrescentamos um ponto de interrogação no tipo da variável ou constante.

```swift
`var` `str: String?`
```

A variável  `str` não é mais do tipo  `String`. Agora é do tipo  `String`  _opcional_. Isso é importante entender. O resultado ou efeito é que não podemos mais interagir diretamente com o valor da variável  `str`. O valor é armazenado com segurança no opcional e precisamos perguntar ao opcional pelo valor que ele encapsula.

### Forçando o desempacotamento (Forced Unwrapping)

Uma forma de acessar o valor de um opcional é através do desempacotamento forçado. Podemos acessar o valor da variável  `str`, acrescentando um  `!`  no nome da variável.

```swift
`var` `str: String?`

`str =` `"Test"`

`println(str!)`
```

É importante que você tenha certeza que o opcional tenha um valor quando você forçar o desempacotamento. Se o opcional não tiver um valor e você forçar o desempacotamento, o Swift retornará um erro para você.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/22874/image/figure-forced-unwrapping.jpg)

### Optional binding

Há uma maneira mais segura para acessar o valor de um opcional. Daremos uma olhada mais atenta na instrução `if` em poucos minutos, mas o exemplo a seguir mostra como podemos acessar com segurança o valor armazenado na variável  `str`, que é do tipo  `String`  opcional.

```swift
`var` `str: String?`

`if` `str != nil {`

`println(str!)`

`}` `else` `{`

`println(``"str has no value"``)`

`}`
```

Primeiro verificamos se a variável  `str`  é igual  `nil`  antes de imprimir seu conteúdo. Neste exemplo,  `str`não tem um valor, o que significa que não será forçado o desempacotamento por acidente.

Há uma abordagem mais elegante chamada optional binding. No exemplo a seguir, podemos atribuir o valor armazenado no opcional a uma constante temporária, que é usada na instrução  `if`. O valor do opcional  `str`  é ligado à constante  `strConst`  e usado na instrução  `if`. Essa abordagem também funciona em instruções  `while`.

```swift
`var` `str: String?`

`str =` `"Test"`

`if` `let` `strConst = str {`

`println(strConst)`

`}` `else` `{`

`println(``"str has no value"``)`

`}`

```

### O que é  `nil`?

Se você está vindo do Objective-C, você certamente sabe o que é o  `nil`. Em Objective-C,  `nil`  é um ponteiro para um objeto que não existe. O Swift define  `nil` de uma forma um pouco diferente e é importante que você entenda a diferença.

Em Swift,  `nil`  significa a falta de valor, nenhum valor. Enquanto o `nil`  só é aplicável aos objetos em Objective-C, em Swift  `nil`  pode ser usado em qualquer tipo. Portanto, é importante entender que um opcional não é o equivalente de `nil`  em Objective-C. Estes conceitos são muito diferentes.

## 2. Controle de fluxo

O Swift oferece uma quantidade de construtores comuns para controlar o fluxo do seu código. Se você tem alguma experiência de programação, então você não terá problemas em ganhar tempo com os construtores de controle de fluxo do Swift, instruções condicionais `if`  e  `switch`, e laços `for`  e  `while`.

No entanto, Swift não seria Swift se seus controles de fluxo não fossem um pouco diferente de, por exemplo, construtores de controle de fluxo do Objective-C. Embora os detalhes sejam importantes, eu tenho certeza que eles não vão impedir de ganhar tempo com Swift. Vamos começar com o construtor condicional mais comum, a instrução  `if`.

### `if`

As instruções  `if`  em Swift são muito similares as existentes em Objective-C. A principal diferença é que não há necessidade em manter a condição entre parênteses. As chaves, no entanto, são obrigatórias. O último impede os desenvolvedores de inserir erros comuns que estão relacionados a escrever  `if`  sem chaves. Isto é como uma instrução  `if` se parece em Swift.

```swift
`let` `a = 10`

`if` `a > 10 {`

`println(``"The value of \"a\" is greater than 10."``)`

`}` `else` `{`

`println(``"The value of \"a\" is less than or equal to 10."``)`

`}`
```

E não deve ser surpresa que Swift também define uma cláusula  `else`. O código na clausura  `else`  é executado se a condição for igual a  `false`. Também é possível encadear declarações  `if`  como mostrado no exemplo a seguir.

```swift
`let` `a = 10`

`if` `a > 10 {`

`println(``"The value of \"a\" is greater than 10."``)`

`}` `else` `if` `a > 5 {`

`println(``"The value of \"a\" is greater than 5."``)`

`}` `else` `{`

`println(``"The value of \"a\" is less than or equal to 5."``)`

`}`
```

Há uma observação importante a se fazer, a condição da instrução  `if`  precisa retornar  `true` ou  `false`. Isso não é necessário em instruções  `if`  de Objective-C. Dê uma olhada na seguinte instrução  `if`  de Objective-C.

```swift
`NSArray` `*array = @[];`

`if` `(array``.count``) {`

`NSLog(``@"The array contains one or more items."``);`

`}` `else` `{`

`NSLog(``@"The array is empty."``);`

`}`
```

Se fôssemos transformar o trecho de código acima em Swift, receberiamos um erro. O erro não é muito informativo, mas o Swift nos diz que precisamos garantir que o resultado da condição seja  `true`  ou  `false`.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/22874/image/figure-if-clause-1.jpg)

A maneira correta de traduzir o trecho acima do Objective-C para Swift é certificando que a condição da instrução  `if`  retorne  `true`  ou  `false`, como no trecho a seguir.

```swift
`let` `array = [String]()`

`if` `array.count > 0 {`

`println(``"The array contains one or more items."``)`

`}` `else` `{`

`println(``"The array is empty."``)`

`}`
```

### `switch`

A instrução  `switch`  de Swift é mais poderosa do que seu equivalente em Objective-C. É também a mais segura que você aprenderá no momento. Embora existam algumas diferenças, a instruções  `switch`  no Swift aderem ao mesmo conceito que as de outras linguagens de programação, um valor é passado para a instrução  `switch`  e é comparado a possíveis padrões correspondentes.

É isso mesmo, padrões. Como eu disse, uma instrução  `switch`  no Swift tem alguns truques na manga. Vamos dar uma olhada nesses truques em instantes. Vamos falar sobre segurança primeiro.

#### Exaustivo

Uma instrução  `switch`  no Swift precisa ser exaustiva, o que significa que todo valor possível do tipo que entrou para a instrução  `switch`  precisa ser tratado pela instrução  `switch`. Como em Objective-C, isto é facilmente resolvido adicionando um caso  `default`, como no exemplo a seguir.

```swift
`let` `a = 10`

`switch` `a {`

`case` `0:`

`println(``"a is equal to 0"``)`

`case` `1:`

`println(``"a is equal to 1"``)`

`default``:`

`println(``"a has another value"``)`

`}`
```

#### Fallthrough

Uma diferença importante com a implementação das instruções  `switch` do Objective-C é a falta de fallthrough implícita. O exemplo a seguir não funciona no Swift por alguns motivos.

```swift
`let` `a = 10`

`switch` `a {`

`case` `0:`

`case` `1:`

`println(``"a is equal to 1"``)`

`default``:`

`println(``"a has another value"``)`

`}`
```


O primeiro caso em que  `a`  é comparado com  `0` não passa implicitamente para o segundo caso em que  `a`  é comparado com  `1`. Se você adicionar o exemplo acima em seu playground, você observará que o Swift mostrará um erro para você. O erro diz que cada caso deve incluir pelo menos uma instrução executável.

Observe que os casos da instrução  `switch`  não incluem instruções `break`  para sair da instrução  `switch`. Isso não é necessário em Swift desde o fallthrough implícita não existe na Swift. Isso vai eliminar uma série de erros comuns causados por fallthrough não intencional.

#### Padrões

O poder de uma instrução  `switch`  no Swift está na correspondência de padrões. Dê uma olhada no exemplo a seguir que usei intervalos para comparar o valor considerado.

```swift
`let` `a = 10`

`switch` `a {`

`case` `0..<5:`

`println(``"The value of a lies between 0 and 4."``)`

`case` `5...10:`

`println(``"The value of a lies between 5 and 10."``)`

`default``:`

`println(``"The value of a is greater than 10."``)`

`}`
```

O operador  `..<` ou operador de intervalo semi-aberto define um intervalo do primeiro para o segundo valor, excluindo o segundo valor. O operador  `...` ou operador de intervalo fechado define um intervalo do primeiro para o segundo valor, incluindo o segundo valor. Esses operadores são muito úteis em uma ampla gama de situações.

Você também pode comparar o valor considerado de uma instrução  `switch`  com tuplas. Dê uma olhada no exemplo a seguir para ver como isso funciona.

```swift
`let` `latlng = (34.15, -78.03)`

`switch` `latlng {`

`case` `(0, 0):`

`println(``"We're at the center of the planet."``)`

`case` `(0...90, _):`

`println(``"We're in the Northern hemisphere."``)`

`case` `(-90...0, _):`

`println(``"We're in the Southern hemisphere."``)`

`default``:`

`println(``"The coordinate is invalid."``)`

`}`

```

Como você pode ver no exemplo acima, é possível que o valor corresponda a mais de um caso. Quando isso acontece, o primeiro caso correspondente é escolhido. O exemplo acima também ilustra o uso do sublinhado. Como vimos no  [artigo anterior](http://code.tutsplus.com/tutorials/swift-from-scratch-collections-and-tuples--cms-22832), podemos usar um caractere de sublinhado,  `_`, para dizer ao Swift quais valores não estamos interessados.

#### Ligação de Valor

Ligação de valor também é possível com instruções  `switch`  como o exemplo a seguir demonstra. O segundo valor da tupla é temporariamente ligado à constante `description` para o uso no primeiro e segundo caso.

```swift
`var` `response = (200,` `"OK"``)`

`switch` `response {`

`case` `(200..<400,` `let` `description):`

`println(``"The request was successful with description \(description)."``)`

`case` `(400..<500,` `let` `description):`

`println(``"The request was unsuccessful with description \(description)."``)`

`default``:`

`println(``"The request was unsuccessful with no description."``)`

`}`
```

### `for`

O laço `for`  é a primeira instrução de looping que vamos dar uma olhada. Ele se comporta de forma semelhante a laços `for` em outras linguagens. Existem duas formas, o de laço `for`  e o laço `for-in`.

#### `for`

O laço  `for`  do Swift é quase idêntico a um laço  `for`  em Objective-C, como o exemplo a seguir ilustra. O laço  `for`  executa uma série de instruções até que a condição pré-definida seja cumprida.

```swift
`for` `var` `i = 0; i < 10; i++ {`

`println(``"i is equal to \(i)."``)`

`}`

```

Como acontece com a instruções  `if`, não há nenhuma necessidade de usar parênteses para delimitar a inicialização do laço, condição e a definição de incremento. A instrução do laço, porém, precisa ser delimitada por chaves.

#### `for-in`

O laço  `for-in`  é ideal para um looping sobre o conteúdo de um range ou coleções. No exemplo a seguir, nós percorremos os elementos de um array.

```swift
`let` `numbers = [1, 2, 3, 5, 8]`

`for` `number` `in` `numbers {`

`println(``"number is equal to \(number)"``)`

`}`

```

Também podemos usar os laços `for-in`  para percorrer os pares chave-valor de um dicionário. No exemplo a seguir, nós declaramos um dicionário e imprimimos o conteúdo no console. Como vimos anteriormente nesta série, a sequência dos pares chave-valor é indefinido já que um dicionário é um conjunto não ordenado de pares chave-valor.

```swift
`var` `bids = [``"Tom"``: 100,` `"Bart"``: 150,` `"Susan"``: 120]`

`for` `(name, bid)` `in` `bids {`

`println(``"\(name)'s bid is $\(bid)."``)`

`}`

```

Cada par chave-valor de um dicionário é acessado pelo laço for-in como uma tupla de constantes nomeadas. O laço  `for-in`  é ótimo em combinação com ranges. Tenho certeza que você concorda que o código abaixo é fácil de ler e de compreender graças à utilização de um intervalo fechado.
```swift
`for` `i` `in` `1...10 {`

`println(``"i is equal to \(i)"``)`

`}`
```

### `while`

O laço  `while`  também vem com duas variações,  `while`  e  `do-while`. A principal diferença é que o conjunto de instruções de um laço  `do-while`  é sempre executado pelo menos uma vez, por que a condição do  `do-while`  é avaliada no final de cada interação. O exemplo a seguir ilustra está diferença.

```swift
`var` `c = 5`

`var` `d = 5`

`while` `c < d {`

`println(``"c is smaller than d"``)`

`}`

`do` `{`

`println(``"c is smaller than d"``)`

`}` `while` `c < d`

```

A instrução  `println`  do laço  `while`  nunca será executada enquanto a do laço  `do-while`  é executada uma vez.

Em muitos casos, o laço  `for`  pode ser reescrito como o laço  `while`  e geralmente é o desenvolvedor que determina qual tipo de laço deve usar em uma situação particular. Os seguintes laços  `for`  e  `while`resulta na mesma saída.

```swift
`for` `var` `i = 0; i < 10; i++ {`

`println(i)`

`}`

`var` `i = 0`

`while` `i < 10 {`

`println(i)`

`i++`

`}`
```


## Aprender com exemplo

Uma função nada mais é do que um bloco de código que pode ser executada sempre que necessário. Eu gostaria de começar com um exemplo para discutir a anatomia básica de uma função em Swift. Vá até o Xcode e crie um novo playground. Adicione a seguinte definição de função ao playground.

```swift
`func printHelloWorld() {`

`println(``"Hello World!"``)`

`}`
```

Uma função começa com a palavra-chave  `func`  e é seguida do nome da função,  `printHelloWorld`  no nosso exemplo. Como em muitas outras linguagens, o nome da função é seguido por parênteses que contêm os parâmetros da função, a entrada da função.

O corpo da função é cercado por chaves. A função  `printHelloWorld`  contém uma declaração a qual imprimi a string  `Hello World!`  na saída padrão. Isso é como uma função básica se parece em Swift. A sintaxe é simples, limpa e minimalista.

Você pode chamar a função digitando o nome da função, seguido por parênteses.

```swift
`printHelloWorld()`
```

## 2. Parâmetros

Vamos deixar o exemplo acima um pouco mais complexo, adicionando parâmetros á definição da função. Isso significa simplesmente que oferecemos a função com valores de entrada que podem ser usados no corpo da função. No exemplo a seguir, definimos a função  `printMessage`, que aceita um parâmetro,  `message`, do tipo  `String`.

```swift
`func printMessage(message: String) {`

`println(message)`

`}`
```

Uma função pode aceitar vários parâmetros ou valores de entrada. Os parâmetros são envolvidos por parênteses após o nome da função. O nome do parâmetro é seguido por dois-pontos e o tipo do parâmetro. Como você se lembra, isso é muito semelhante a declarar uma variável ou constante. Simplesmente diz que o parâmetro  `message`  é  _do tipo_  `String`.

Em vez de imprimir uma string codificada como fizemos na função  `printHelloWorld`, imprimimos o valor do parâmetro `message`. Isso torna a função mais útil e flexível.

Chamar a função é muito semelhante ao que vimos anteriormente. A única diferença é que passamos um argumento ao chamar a função.

```swift
`printMessage(``"Hello World!"``)`
```


Observe que os termos  **parâmetros**  e  **argumentos**  são usados frequentemente como sinônimos, mas há uma diferença sutil na semântica em Swift. No Swift, parâmetros são os valores especificados na definição de função, enquanto os argumentos são os valores passados para a função quando ela é chamada.

### Múltiplos parâmetros

Como mencionado anteriormente, a sintaxe das funções é muito flexível e não deveria se surpreender que é perfeitamente possível passar vários argumentos para uma função. No próximo exemplo, criamos uma variação da função  `printMessage`  que nos permite imprimir a mensagem várias vezes.

```swift
`func printMessage(message: String, times: Int) {`

`for` `i` `in` `0..<times {`

`println(``"\(i) \(message)"``)`

`}`

`}`

```

Enquanto o nome da função é idêntico da função original  `printMessage`, o tipo da função é diferente. É importante você entender a sentença anterior. Leia novamente.

Cada função tem um tipo, constituído de tipos de parâmetro e o tipo de retorno. Exploraremos os tipos de retorno em instantes. Funções podem ter o mesmo nome desde que seu tipo seja diferente, como mostram as definições das duas funções anteriores.

O tipo da primeira função é  `(String)-> ()`  enquanto o tipo da segunda função é  `(String, Int)-> ()`. O nome de ambas as funções é o mesmo. Não se preocupe com o símbolo  `->`. Seu significado se tornará claro em alguns instantes, quando discutirmos os tipos de retorno.

A segunda função  `printMessage`  define dois parâmetros,  `message`  do tipo  `String`  e  `times`  do tipo  `Int`. Esta definição ilustra uma das características que Swift tem adotada de Objective-C, nome de funções/métodos legíveis. Enquanto o nome da função é  `printMessage`, lendo os nomes dos parâmetros da função, é fácil de entender o que a função supostamente faz.

Na segunda função `printMessage`, nós criamos um laço  `for-in` para imprimir a strings  `message`, `times`vezes. Nós usamos o operador de intervalo semi-aberto,  `..<`, como vimos no início desta série.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/22879/image/figure-autocompletion.jpg)

Quando começamos a digitar  `printMessage`  no playground, o Xcode exibe as duas funções no menu de AutoCompletar. Graças ao tipo da função, é fácil escolher a função que estamos interessados. Chamar a segunda função  `printMessage` é tão simples como:

```swift
`printMessage(``"Hello World"``, 3)`
```

### Valores padrão

Um dos meus recursos favoritos é a capacidade de definir valores padrão para parâmetros. Isso pode parecer bobo, se você está vindo de uma linguagem que tem esse recurso há séculos, mas isso é ótimo se você tem trabalhado com C e Objective-C, por muitos anos.

Resumindo, Swift permite aos desenvolvedores definir valores padrão para os parâmetros de uma função. Vamos definir uma nova função que imprime a data atual em um formato específico. Certifique-se de que você adicionou a seguinte instrução de importação na parte superior do seu playground para importar o framework UIKit.

```swift
`import UIKit`
```

Vamos primeiro definir a função de  `printDate`  sem fazer uso de valores padrão para qualquer um dos parâmetros.

```swift
`func printDate(date: NSDate, format: String) {`

`let` `dateFormatter = NSDateFormatter()`

`dateFormatter.dateFormat = format`

`println(dateFormatter.stringFromDate(date))`

`}`
```

Se você não estiver familiarizado com o framework Foundation e você não está entendendo o que está acontecendo no corpo da função, então tudo bem. O foco deste exemplo não é sobre a implementação da formatação da data. Em  `printDate`, usamos o valor do parâmetro  `format`  para formatar o valor de  `date`. Se não passarmos um valor para o parâmetro  `format`, o Swift irá nos informar mostrando um erro.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/22879/image/figure-missing-parameter-1.jpg)

Podemos resolver esta situação, definindo um valor padrão para o segundo parâmetro da função, conforme a definição da função atualizada abaixo.

```swift
`func printDate(date: NSDate, format: String =` `"YY/MM/dd"``) {`

`let` `dateFormatter = NSDateFormatter()`

`dateFormatter.dateFormat = format`

`println(dateFormatter.stringFromDate(date))`

`}`
```

Definir um valor padrão é tão simples como especificar um valor na lista de parâmetros na definição da função. O resultado é que o Swift não vai reclamar e o erro desaparece.

```swift
`printDate(NSDate())`
```

E se nós quisermos passar um valor para o parâmetro de  `format`? Vamos testar e ver o que o Swift nos diz.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/22879/image/figure-missing-parameter-2.jpg)

Como o parâmetro  `format` tem um valor padrão, e é opcional, precisamos passar o nome do argumento para dizer ao Swift a qual parâmetro estamos nos referindo. A correção é muito simples, como você pode ver abaixo.

```swift
`printDate(NSDate(), format:` `"dd/MM/YY"``)`
```

Note que a Apple recomenda que os parâmetros com um valor padrão sejam posicionados no final da lista de parâmetros. Esta é certamente uma boa idéia e comum na maioria das outras linguagens de programação que oferecem suporte a parâmetros opcionais.

## 3. Tipo de retorno

As funções que vimos até agora não retornam nada quando a chamamos. Vamos fazer a função `printDate`  mais útil, retornando a data formatada como uma string, em vez de imprimir a data formatada de dentro da função. Isso requer duas mudanças, como você pode ver abaixo.

```swift
`func printDate(date: NSDate, format: String =` `"YY/MM/dd"``) -> String {`

`let` `dateFormatter = NSDateFormatter()`

`dateFormatter.dateFormat = format`

`return` `dateFormatter.stringFromDate(date)`

`}`
```

A primeira coisa que nós mudamos é a definição da função. Após a lista de parâmetros especificamos o tipo do retorno,  `String`. O tipo de retorno é precedido pelo símbolo `->`. Se você já trabalhou com CoffeeScript, então isso vai parecer familiar.

Em vez de imprimir a data formatada usando a função  `println`, usamos o palavra-chave  `return`  para retornar o valor da função. Isso é tudo que precisamos fazer. Vamos testá-lo.

```swift
`let` `formattedDate = printDate(NSDate(), format:` `"dd/MM/YY"``)`

`println(formattedDate)`
```

Chamamos a função  `printDate`, armazenamos o valor retornado na constante  `formattedDate`  e vamos imprimir o valor de  `formattedDate`  na saída padrão. Observe que o nome da função  `printDate`  já não reflete o que ele faz, então você pode querer alterá-lo para  `formatDate`.

### Nenhum tipo de retorno

As outras funções que definimos neste tutorial não tem um tipo de retorno. Quando uma função não tem um tipo de retorno, não é necessário incluir o símbolo  `->`  na definição de função.

Alguns parágrafos atrás, eu disse que nenhuma das funções que tinha definido retornava um valor para nós. Isso não é inteiramente verdade. Deixe-me explicar os detalhes essenciais com um experimento. Adicione a seguinte linha ao seu playground e veja o que acontece.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/22879/image/figure-no-return-type-1.jpg)

Isto é interessante. O Swift não da um erro que nós armazenamos o valor de retorno da função  `printHelloWorld`  em uma constante, mas informa que é incapaz de identificar o tipo do  `valor`  da constante.

O que está acontecendo aqui? Toda função em Swift retorna um valor, mesmo se nós não definimos um tipo de retorno na definição de função. Quando uma função não especifica explicitamente um tipo de retorno, a função implicitamente retorna  `Void`, o que equivale a uma tupla vazia, ou  `()` para ser breve. Você pode ver isso no painel de saída do playground, como mostrado na imagem acima.

Podemos nos livrar do aviso acima declarando explicitamente o tipo de  `valor`, uma tupla vazia. Concordo que não é muito útil armazenar uma tupla vazia em uma constante, mas ilustra que toda função tem um valor de retorno.

```swift
`let` `value: () = printHelloWorld()`
```


### Tuplas

Outra grande característica do Swift é a capacidade de retornar multiplos valores a partir de uma função, retornando uma tupla. O exemplo a seguir ilustra como isto funciona. Deixe-me repetir que não é importante que você entenda como a função  `timeComponentsForDate`  funciona. O foco é o valor de retorno da função  `timeComponentsForDate`, uma tupla com três elementos.

```swift
`func timeComponentsForDate(date: NSDate) -> (hour: Int, minute: Int, second: Int) {`

`let` `dateComponents = NSCalendar.currentCalendar().components((.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond), fromDate: date)`

`let` `hour = dateComponents.hour`

`let` `minute = dateComponents.minute`

`let` `second = dateComponents.second`

`return` `(hour, minute, second)`

`}`
```

A função aceita um argumento, uma instância de  `NSDate`  e retorna uma tupla com três valores rotulados. Rotular valores da tupla é apenas para sua comodidade, é possível omitir os rótulos.

```swift
`func timeComponentsForDate(date: NSDate) -> (Int, Int, Int) {`

`let` `dateComponents = NSCalendar.currentCalendar().components((.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond), fromDate: date)`

`let` `hour = dateComponents.hour`

`let` `minute = dateComponents.minute`

`let` `second = dateComponents.second`

`return` `(hour, minute, second)`

`}`
```

No entanto, como o exemplo a seguir ilustra, rotular os valores da tupla retornada pela função é muito conveniente e torna seu código mais fácil de entender.

```swift
`let` `timeComponents = timeComponentsForDate(NSDate())`

`println(timeComponents.hour)`

`println(timeComponents.minute)`

`println(timeComponents.second)`
```

Também é possível retornar um valor opcional de uma função, se há situações em que a função não tem valor para retornar. Isto é tão simples como definir o tipo de retorno da função como opcional como mostrado abaixo.
```swift
`func timeComponentsForDate(date: NSDate) -> (hour: Int, minute: Int, second: Int)? {`

`let` `dateComponents = NSCalendar.currentCalendar().components((.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond), fromDate: date)`

`let` `hour = dateComponents.hour`

`let` `minute = dateComponents.minute`

`let` `second = dateComponents.second`

`return` `(hour, minute, second)`

`}`
```

## 1. Nomes de parâmetros local e externo

### Nomes de Parâmetro Local

Vamos revisar um dos exemplos do artigo anterior. A função  `printMessage`  define um parâmetro,  `message`.

```swift
`func printMessage(message: String) {`

`println(message)`

`}`
```

Mesmo definindo um nome para o parâmetro,  `message`, não usamos o nome quando chamamos a função. Passamos o valor para o parâmetro  `message`.

```swift
`printMessage(``"Hello, world!"``)`
```

O nome que definimos na definição da função é um nome  **local**  do parâmetro. O nome do parâmetro so poderá ser referenciado por este nome no corpo da função. Parâmetros de funções, porém, são um pouco mais flexíveis que isso. Deixe-me explicar o que quero dizer com isso.

O Objective-C é conhecido por seus nomes de método longos. Apesar disto parecer desajeitado e deselegante a estranhos, faz com que os métodos sejam fáceis de compreender e, se bem escolhido, muito descritivo. Se você acha que perdeu este benefício quando mudou para o Swift, então você terá uma surpresa.

### Nomes de parâmetros externo

Quando uma função aceita vários parâmetros, nem sempre é óbvio qual argumento corresponde a qual parâmetro. Dê uma olhada no exemplo a seguir para entender melhor o problema.

```swift

`func power(a: Int, b: Int) -> Int {`

`var` `result = a`

`for` `_` `in` `1..<b {`

`result = result * a`

`}`

`return` `result`

`}`
```

A função  `power`  eleva o valor de  `a`  pelo expoente  `b`. Ambos os parâmetros são do tipo  `Int`. Enquanto a maioria das pessoas intuitivamente vai passar o valor de base como o primeiro argumento e o expoente como o segundo argumento, não é evidente a partir do tipo da função, nome ou assinatura. Como já vimos no  [artigo anterior](http://code.tutsplus.com/tutorials/swift-from-scratch-an-introduction-to-functions--cms-22879), chamar a função é simples.
```swift
`power(2, 3)`
```

Para evitar confusão, podemos dar aos parâmetros de uma função nomes externos. Podemos usar estes nomes externos quando a função é chamada para indicar inequivocamente qual argumento corresponde a qual parâmetro. Dê uma olhada no exemplo atualizado abaixo.
```swift
`func power(base a: Int, exponent b: Int) -> Int {`

`var` `result = a`

`for` `_` `in` `1..<b {`

`result = result * a`

`}`

`return` `result`

`}`
```

Observe que o corpo da função não muda desde que os nomes locais não mudem. No entanto, quando nós chamamos a função atualizada, a diferença é clara e o resultado menos confuso.

```swift
`power(base: 2, exponent: 3)`
```

Apesar de os tipos de ambas as funções sejam os mesmos,  `(Int, Int)-> Int`, as funções são diferentes. Em outras palavras, a segunda função não é uma redeclaração da primeira função. A sintaxe para chamar a segunda função para alguns de vocês pode lembrar Objective-C. Não só os argumentos são claramente descritos, mas a combinação de nomes de função e parâmetro descrever a finalidade da função.

Em alguns casos, você vai querer usar os mesmos nomes para os parâmetros locais e externos. Isso é possível e não há nenhuma necessidade de digitar o nome do parâmetro duas vezes. No exemplo a seguir, utilizamos o  `base`  e o  `exponent` como os nomes dos parâmetros locais e externos.

```swift
`func power(``#base: Int, #exponent: Int) -> Int {`

`var` `result = base`

`for` `_` `in` `1..<exponent {`

`result = result * base`

`}`

`return` `result`

`}`
```

Iniciando o nome do parâmetro com um símbolo  `#`, o nome do parâmetro serve como o nome do parâmetro local e externo. Isto também significa que precisamos atualizar o corpo da função.

É importante notar que, ao fornecer um nome externo para um parâmetro, é necessário usar esse nome ao chamar a função. Isto leva-nos para valores padrão.

### Valores padrão

Vimos valores de parâmetro padrão no  [artigo anterior](http://code.tutsplus.com/tutorials/swift-from-scratch-an-introduction-to-functions--cms-22879), mas há um comportamento padrão importante que você precisa conhecer. Se você definir um valor padrão para um parâmetro, o Swift automaticamente atribui um nome de parâmetro externo para o parâmetro. Vejamos um exemplo do  [artigo anterior](http://code.tutsplus.com/tutorials/swift-from-scratch-an-introduction-to-functions--cms-22879).

```swift

`func printDate(date: NSDate, format: String =` `"YY/MM/dd"``) -> String {`

`let` `dateFormatter = NSDateFormatter()`

`dateFormatter.dateFormat = format`

`return` `dateFormatter.stringFromDate(date)`

`}`
```

Como o segundo parâmetro,  `format`, tem um valor padrão, o Swift automaticamente define o nome do parâmetro externo da `format`  para `format`. Em outras palavras, o resultado é o mesmo como se fossemos prefixar o  `format`  com um símbolo  `#`. Você pode testar isso chamando a função em seu playground. O que acontece se você passar o format sem utilizar o nome do parêmetro externo do segundo parâmetro? A resposta está a seguir.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/23056/image/figure-default-value-1.jpg)

O Swift é bem claro sobre o que devemos fazer. Para resumir, quando você definir um parâmetro como opcional, o Swift automaticamente define o nome do parâmetro externo para o mesmo nome do parâmetro local. A idéia por trás deste comportamento é evitar confusão e ambigüidade.

Apesar deste comportamento ser uma boa prática recomendada, é possível desativá-lo. Na declaração da função atualizada abaixo, nós adicionamos um underscore onde normalmente podemos acrescentar o nome do parâmetro externo. Isso informa ao Swift que não queremos definir um nome de parâmetro externo para esse determinado parâmetro, apesar de ter um valor padrão.

```swift

`func formatDate(date: NSDate, _ format: String =` `"YY/MM/dd"``) -> String {`

`let` `dateFormatter = NSDateFormatter()`

`dateFormatter.dateFormat = format`

`return` `dateFormatter.stringFromDate(date)`

`}`
```

Agora podemos chamar a função  `formatDate`  sem fornecer um nome para o segundo argumento.

```swift

`formatDate(NSDate(),` `"dd/MM/YY"``)`
```

## 2.  Parâmetros & Mutabilidade

Vamos revisitar o primeiro exemplo deste tutorial, a função  `printMessage`. O que acontece se mudarmos o valor do parâmetro  `message`  dentro do corpo da função?

```swift
`func printMessage(message: String) {`

`message =` `"Print: \(message)"`

`println(message)`

`}`
```

Não vai demorar muito para o Swift começar a reclamar.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/23056/image/figure-parameter-constants-1.jpg)

Por padrão, os parâmetros de uma função são constantes. Em outras palavras, apesar de podermos acessar os valores dos parâmetros das funções, não podemos alterar seu valor. Para alterar esse comportamento padrão, adicione a palavra-chave  `var` ao nome do parâmetro na definição de função. O Swift irá criar uma variável cópia do valor do parâmetro para você trabalhar no corpo da função.

```swift

`func printMessage(``var` `message: String) {`

`message =` `"Print: \(message)"`

`println(message)`

`}`
```

Note que isto não significa que você possa passar um valor, modifica-lo na função e usar o valor modificado depois que a função finalizar seu trabalho. O Swift cria uma cópia do valor do parâmetro que existirá apenas durante o tempo de vida de função. Isso também é ilustrado no seguinte bloco de código em que podemos passar uma constante para a função de  `printMessage`.

```swift

`func printMessage(``var` `message: String) {`

`message =` `"Print: \(message)"`

`println(message)`

`}`

`let` `myMessage =` `"test"`

`printMessage(myMessage)`
```

## 3.  Parâmetros variáveis

Apesar do termo parecer confuso à primeira vista, parâmetros variáveis são comuns na programação. Um parâmetro variável é um parâmetro que aceita nenhum ou muitos valores. Os valores precisam ser do mesmo tipo. Usar parâmetros variáveis no Swift é trivial, como o exemplo a seguir ilustra.

```swift

`func sum(args: Int...) -> Int {`

`var` `result = 0`

`for` `a` `in` `args {`

`result += a`

`}`

`return` `result`

`}`
```

A sintaxe é fácil de entender. Para marcar um parâmetro como variável, você acrescenta três pontos no tipo de parâmetro. No corpo da função, o parâmetro variável é acessado como um array. No exemplo acima,  `args`  é um array de valores  `Int`

Como o Swift precisa saber quais argumentos correspondem a quais parâmetros, um parâmetro variável precisa ser o último parâmetro. Isso também implica que uma função pode ter no máximo um parâmetro variável.

A afirmação acima também se aplica se uma função tem parâmetros com valores padrão. O parâmetro variável deve ser sempre o último parâmetro.

## 4. Parâmetros de entrada/saída (In-Out)

Anteriormente neste tutorial, você aprendeu como definir a mutabilidade de um parâmetro usando a palavra-chave  `var`. Nessa seção, enfatizei que o valor de um parâmetro só é acessível dentro do corpo da função. Se você quiser passar um valor para uma função, modificá-lo na função e devolve-lo para fora da função, parâmetros de entrada/saída são o que você está procurando.

O exemplo a seguir demonstra um exemplo de como um parâmetro de entrada/saída trabalha no Swift e como é sua sintaxe.

```swift

`func prependString(inout a: String, withString b: String) {`

`a = b + a`

`}`
```

Definimos o primeiro parâmetro como um parâmetro de entrada/saída, adicionando a palavra-chave  `inout`. O segundo parâmetro é um parâmetro normal com um nome externo de  `withString`  e um nome local de  `b`. Vamos ver como chamamos essa função.
```swift

`var` `world =` `"world"`

`prependString(&world, withString:` `"Hello, "``)`
```

Declaramos uma variável,  `world`, do tipo  `String`  e passamos para a função  `perpendString`. O segundo parâmetro é uma string literal. Ao chamar a função, o valor da variável  `world`  torna-se  `"Hello, world"`. Note que o primeiro argumento é iniciado com um "e" comercial,  `&`, para indicar que ele é uma parâmetro de entrada/saída.

Nem é preciso dizer que constantes e literais não podem ser passados como parâmetros entrada/saída. O Swift informará um erro quando você fizer, como ilustrado na tela abaixo.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/23056/image/figure-inout-error-1.jpg)

É evidente que parâmetros de entrada/saída não podem ter valores padrão, ser variável, ou ser definidos como  `var`  ou  `let`. Se você esquecer desses detalhes, gentilmente o Swift irá lembrá-lo com um erro.

## 5.  Encadeamento (Nesting)

Em C e Objective-C, funções e métodos não podem ser encadeados. Em Swift, entretanto, encadear funções é muito comum. As funções que vimos neste e no  [artigo anterior](http://code.tutsplus.com/tutorials/swift-from-scratch-an-introduction-to-functions--cms-22879)  são exemplos de funções globais, elas são definidas no escopo global.

Quando definimos uma função dentro de uma função global, nos referimos a essa função como uma função encadeada. Uma função encadeada tem acesso aos valores definidos em sua função envolvente. De uma olhada no exemplo a seguir para melhor entender.

```swift

`func printMessage(message: String) {`

`let` `a =` `"hello world"`

`func printHelloWorld() {`

`println(a)`

`}`

`}`
```

Apesar das funções neste exemplo não serem muito úteis, o exemplo ilustra a idéia de uma função encadeada e capturando valores. A função  `printHelloWorld`  é apenas acessível dentro da função  `printMessage`. Como demonstrado no exemplo, a função  `printHelloWorld`  tem acesso a constante  `a`. O valor é capturado pela função encadeada e portanto é acessível de dentro da função. O Swift se encarrega de capturar os valores, incluindo a gestão da memória desses valores.


## 6.  Tipos de função

No  [artigo anterior](http://code.tutsplus.com/tutorials/swift-from-scratch-an-introduction-to-functions--cms-22879), falamos brevemente sobre tipos de função. Uma função tem um tipo particular, composto pela tipo do parâmetro da função e pelo tipo de retorno. A função  `printMessage`, por exemplo, é do tipo  `(String) -> ()`. Lembre-se que  `()`  simboliza  `Void`, que é o equivalente a uma tupla vazia.

Por conta de todas as funções ter um tipo, é possível definir uma função que aceita outra função como parâmetro. O exemplo a seguir mostra como isso funciona.

```swift

`func printMessageWithFunction(message: String, printFunction: (String) -> ()) {`

`printFunction(message)`

`}`

`let` `myMessage =` `"Hello, world!"`

`printMessageWithFunction(myMessage, printMessage)`
```

A função  `printMessageWithFunction`  aceita uma string como primeiro parâmetro e uma função do tipo  `(String) -> ()`  como segundo parâmetro. No corpo da função, a função que passamos é chamada com o argumento  `message`.

O exemplo também demonstra como podemos chamar a função  `printMessageWithFunction`. A constante  `myMessage`  é passada como o primeiro argumento e a função  `printMessage`, que definimos anteriormente, como o segundo argumento. Isso não é legal?

Como eu mencionei anteriormente, também é possível retornar uma função de uma função. O próximo exemplo é um pouco complexo, mas ilustra o que se parece com a sintaxe.

```swift
`func compute(addition: Bool) -> (Int, Int) -> Int {`

`func add(a: Int, b: Int) -> Int {`

`return` `a + b`

`}`

`func subtract(a: Int, b: Int) -> Int {`

`return` `a - b`

`}`

`if` `addition {`

`return` `add`

`}` `else` `{`

`return` `subtract`

`}`

`}`

`let` `computeFunction = compute(``true``)`

`let` `result = computeFunction(1, 2)`

`println(result)`
```

A função  `compute`  aceita um boolean e retorna uma função do tipo  `(Int, Int) -> Int`. A função  `compute`contem duas funções encadeadas que são do tipo  `(Int, Int) -> Int`,  `add`  e  `subtract`.

A função  `compute`  retorna uma referência da função  `add`  ou da  `subtract`, baseado no valor do parâmetro  `addition`. O exemplo também mostra como usar a função `compute`. Armazenamos uma referência da função que é retornada pela função  `compute`  na constante  `computeFunction`. Então chamamos a função armazenada em  `computeFunction`, passando  `1`  e  `2`, armazenamos o resultado em  `result`  e imprimimos o valor do  `result`  na saída padrão. O exemplo pode parecer complexo, mas é realmente fácil de entender se você sabe o que está acontecendo.

Se você trabalhou com blocos em C/Objective-C ou lambdas em Ruby, então você não terá problemas para entender o conceito de closures. Closures são nada mais do que blocos de funcionalidade que você pode passar durante seu código.

Na verdade, nós já trabalhamos com closures nos dois artigos anteriores. É isso mesmo. Funções são closures também. Vamos começar com o básico e inspecionar a anatomia de uma closure.

## 1.  O que é uma closure?

Como eu disse, uma closure é um bloco de funcionalidade que você pode passar durante seu código. Você pode passar uma closure como um argumento de uma função ou você pode armazená-la como uma propriedade de um objeto. Closures tem muitos casos de uso.

O nome  _closure (fecho)_  sugere uma das características chave das closures. Uma closure captura as variáveis e constantes do contexto no qual ela está definida. Isto é por vezes referido como  _closing over (fechando sobre)_ as variáveis e constantes. Nós vamos olhar para captura de valor mais detalhadamente no final deste artigo.

### Flexibilidade

Você já aprendeu que funções podem ser incrivelmente poderosas e flexíveis. Como as funções são closures, closures são igualmente flexíveis. Neste artigo, você vai descobrir quão flexível e poderosa elas são.

### Gerenciamento de memória

A linguagem de programação C tem um conceito similar, blocos. As closures em Swift, no entanto, tem alguns benefícios. Uma das vantagens chave das closures em Swift é que o gerenciamento de memória é algo que você, o desenvolvedor, não tem que se preocupar.

Até reter ciclos, os quais não são incomuns em C/Objective-C, são manipulados pelo Swift. Isto irá reduzir vazamentos de memória difíceis de encontrar ou falhas devido a ponteiros inválidos.

## 2.  Sintaxe

A sintaxe básica de uma closure não é difícil e irá lembrá-lo de funções encadeadas e globais, que abordamos anteriormente nesta série. Dê uma olhada no exemplo a seguir.

```swift
`{(a: Int) -> Int` `in`

`return` `a + 1`

`}`
```

A primeira coisa que você notará é que a closure inteira é cercada por chaves. Parâmetros do closure são cercadas por parênteses, separadas do tipo de retorno pelo símbolo  `->`. A closure acima aceita um argumento,  `a`, do tipo  `Int`  e retornar um  `Int`. O corpo da closure começa depois da palavra-chave  `in`.

Closures nomeadas, ou seja, funções encadeadas e globais, parecem um pouco diferente. O exemplo a seguir deve ilustrar as diferenças.

```swift
`func increment(a: Int) -> Int {`

`return` `a + 1`

`}`
```

As diferenças mais importantes são o uso da palavra-chave  `func`  e a posição dos parâmetros e tipo de retorno. Uma closure começa e termina com chaves, envolvendo os parâmetros, tipo de retorno e o corpo da closure. Apesar dessas diferenças, lembre-se que toda função é uma closure. Mas nem toda closure é uma função.

## 3.  Closures como parâmetros.

Closures são poderosas e o exemplo a seguir ilustra como elas podem ser úteis. No exemplo, criamos um array de estados. Chamamos a função  `map`  no array para criar um novo array que contém apenas as duas primeiras letras de cada Estado com uma string em maiúsculas.

```swift
`var` `states = [``"California"``,` `"New York"``,` `"Texas"``,` `"Alaska"``]`

`let` `abbreviatedStates = states.map({ (state: String) -> String` `in`

`return` `state.substringToIndex(advance(state.startIndex, 2)).uppercaseString`

`})`

`println(abbreviatedStates)`
```

O método ou função  `map`  é comum em muitas linguagens de programação e bibliotecas, como jQuery, PHP e Ruby. No exemplo acima, a função `map`  é chamada no array de  `states`, transforma o seu conteúdo e retorna um novo array que contém os valores transformados.

### Inferência de tipo

Anteriormente nesta série, aprendemos que o Swift é bastante inteligente. Vamos ver exatamente inteligente quanto. A array de Estados é um array de strings. Como chamamos a função  `map`  no array, o Swift sabe que o argumento  `state`  é do tipo  `String`. Isto significa que podemos omitir o tipo, conforme mostrado no exemplo abaixo atualizado.

```swift

`let` `abbreviations = states.map({ (state) -> String` `in`

`return` `state.substringToIndex(advance(state.startIndex, 2)).uppercaseString`

`})`
```

Existem mais algumas coisas que podemos omitir do exemplo acima, originando a seguinte linha de comando.

```swift

`let` `abbreviations = states.map({ state` `in` `state.substringToIndex(advance(state.startIndex, 2)).uppercaseString })`
```

Deixe-me explicar o que está acontecendo. O compilador pode deduzir que retornaremos uma string da closure que passamos para a função  `map`, o que significa que não há nenhuma razão para incluí-lo na definição de expressão da closure. Só podemos fazer isso se o corpo da closure inclui uma única instrução. Nesse caso, podemos colocar essa declaração na mesma linha como na definição da closure, conforme mostrado no exemplo acima. Como não há nenhum tipo de retorno na definição e não precede o símbolo  `->`  no tipo de retorno, podemos omitir os parênteses delimitador dos parâmetros da closure.

### Nomes de argumento abreviados

Porém não para por aqui. Nós podemos fazer uso de nomes de argumento abreviados para simplificar ainda mais a expressão da closure acima. Ao usar uma expressão da closure inline, como no exemplo acima, podemos omitir a lista de parâmetros, incluindo a palavra-chave  `in`  que separa os parâmetros do corpo de encerramento.

No corpo da closure, referenciamos o argumento usando o nome do argumento abreviado que o Swift nos fornece. O primeiro argumento é referenciado por  `$0`, o segundo por  `$1`, etc.

No exemplo atualizado a seguir, eu omiti a lista de parâmetros e a palavra-chave  `in`, e troquei o argumento  `state`  no corpo da closure com o nome do argumento abreviado  `$0`. A instrução resultante é mais concisa, sem comprometer a legibilidade.

```swift

`let` `abbreviations = states.map({ $0.substringToIndex(advance($0.startIndex, 2)).uppercaseString })`
```

### Trailing closures

A linguagem de programação Swift também define um conceito conhecido como trailing closures. A ideia é simples. Se você passar uma closure como o último argumento de uma função, você pode colocar essa closure fora dos parênteses da chamada de função. O exemplo a seguir demonstra como isso funciona.

```swift

`let` `abbreviations = states.map() { $0.substringToIndex(advance($0.startIndex, 2)).uppercaseString }`
```

Se o único argumento da chamada de função é a closure, é possível omitir os parênteses da chamada de função.

```swift

`let` `abbreviations = states.map { $0.substringToIndex(advance($0.startIndex, 2)).uppercaseString }`
```

Note que isto também funciona para closures que contêm várias instruções. Na verdade, é a principal razão da trailing closure está disponível em Swift. Se uma closure for longa ou complexa, e é o último argumento de uma função, muitas vezes é melhor usar a sintaxe de training closure.

```swift
`let` `abbreviations = states.map { (state: String) -> String` `in`

`let` `newState = state.substringToIndex(advance(state.startIndex, 2))`

`return` `newState.uppercaseString`

`}`
```
## 4.  Capturando valores

Quando usamos closures, você encontra-se frequentemente usando ou manipulando constantes e variáveis do ambiente da closure no corpo da closure. Isso é possível e muitas vezes referido como captura de valor. Isso simplesmente significa que uma closure pode capturar os valores de constantes e variáveis do contexto que é definido. Veja o exemplo a seguir para entender melhor o conceito de captura de valor.

```swift

`func changeCase(uppercase: Bool, strings: String...) -> [String] {`

`var` `newStrings = [String]()`

`func changeToUppercase() {`

`for` `s` `in` `strings {`

`newStrings.append(s.uppercaseString)`

`}`

`}`

`func changeToLowerCase() {`

`for` `s` `in` `strings {`

`newStrings.append(s.lowercaseString)`

`}`

`}`

`if` `uppercase {`

`changeToUppercase()`

`}` `else` `{`

`changeToLowerCase()`

`}`

`return` `newStrings`

`}`

`let` `uppercaseStates = changeCase(``true``,` `"Califorina"``,` `"New York"``)`

`let` `lowercaseStates = changeCase(``false``,` `"Califorina"``,` `"New York"``)`
```

Tenho certeza que você concorda que o exemplo acima é um pouco amplo, mas mostra claramente como a captura de valor funciona em Swift. As funções encadeadas,  `changeToUppercase`  e  `changeToLowercase`, tem acesso aos argumentos da função externa,  `changeCase`, bem como a variável  `newString`  declarado na função exterior. Deixe-me explicar o que acontece.

A função `changeCase` aceita um boolean como primeiro argumento e o parâmetros variável do tipo  `String`  como segundo parâmetro. O parâmetro de retorno é um array de string composto pelas strings passadas para a função como segundo argumento. No corpo da função, criamos um array mutável de strings,  `newStrings`, no qual armazenamos e manipulamos as strings.

As funções encadeadas percorrem as string que são passadas para a função  `changeCase`  e alteram o case de cada string. Como você pode ver, elas tem acesso direto as strings passadas para a função  `changeCase`  bem como o array  `newStrings`, que é declarado no corpo da função  `changeCase`.

Verificamos o valor de  `uppercase`, chamando a função apropriada e retornando o array  `newStrings`. As duas linhas no final do exemplo demonstram como funciona a função  `changeCase`.

Mesmo que demonstrei a captura de valor com funções, lembre-se que cada função é uma closure. Em outras palavras, as mesmas regras se aplicam para closures sem nome.

### Closures

Foi mencionado várias vezes neste artigo, funções são closures. Existem três tipos de closures:

-   funções globais
-   funções encadeadas
-   expressões de closures

Funções globais, tais como a função  `println`  da biblioteca padrão do Swift, sem captura de valores. Funções encadeadas, no entanto, tem acesso e podem capturar os valores das constantes e valores da função em que eles são definidos. O exemplo anterior ilustra este conceito.

Expressões de closures, também conhecido como closures anônimas, podem capturar os valores das constantes e variáveis do contexto que eles são definidos. Isto é muito semelhante a funções encadeadas.

### Copiar e referênciar

Uma closure que captura o valor de uma variável é capaz de alterar o valor dessa variável. O Swift é inteligente o bastante para saber se deve copiar ou referenciar os valores das constantes e variáveis capturadas.

Os desenvolvedores que são novos em Swift e tem pouca experiência com outras linguagens de programação terá esse comportamento garantido. No entanto, é uma vantagem importante que o Swift compreenda os valores capturados como estão sendo usados em uma closure e, em conseqüência, pode lidar com gerenciamento de memória para nós.