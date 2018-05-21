# Uma introdução a classes e estruturas

é importante que você tenha um conhecimento básico de programação orientada a objeto. Se você não estiver familiarizado com classes, objetos e métodos, então eu recomendo que você leia primeiro sobre este assunto antes de continuar com este artigo.

## 1.  Introdução

Neste artigo, vamos explorar os conceitos fundamentais de programação orientada a objeto em Swift, classes e estruturas. No Swift, classes e estruturas se sente e se comportam de forma muito semelhantes, mas há uma série de diferenças importantes que você precisa entender para evitar armadilhas comuns.

Em Objective-C, classes e estruturas são muito diferentes. Isso não é verdade para Swift. Em Swift, por exemplo, tanto as classes quanto as estruturas podem ter propriedades e métodos. Ao contrário de estruturas em C, estruturas em Swift podem ser estendidas e estar em conformidade com os protocolos.

A pergunta é "Qual é a diferença entre classes e estruturas?" Vamos revisitar esta pergunta mais tarde neste artigo. Vamos explorar primeiro como é uma classe em Swift.

## 2.  Terminologia

Antes de começarmos a trabalhar com classes e estruturas, eu gostaria de esclarecer alguns termos comumente utilizados na programação orientada a objeto. Os termos  **classes**,  **objetos**  e  **instâncias**, muitas vezes, confundem as pessoas que são novas em programação orientada e, por conseguinte, é importante que você saiba como Swift usa estes termos.

### Objetos e instâncias

Uma  **classe**  é um esquema ou modelo para uma instância dessa classe. O termo objeto é geralmente usado para se referir a uma instância de uma classe. Em Swift, entretanto, classes e estruturas são muito familiares e portanto é mais fácil ou menos confuso para usar o termo instância para ambos, classes e estruturas.

### Métodos e funções

Anteriormente nesta serie, trabalhamos com funções. No contexto de classes e estruturas, geralmente nos referimos a funções como métodos. Em outras palavras, métodos são funções que pertencem a uma classe ou estrutura em particular. No contexto de classes ou estruturas, você pode usar ambos os termos indiferentemente já que todo método é uma função.

## 3.  Definindo uma Classe

Vamos colocar as mãos na massa definindo uma classe. Inicie o Xcode e crie um novo playground. Remova o conteúdo do playground e adicione a seguinte definição de classe.

1

2

3

`class` `Person {`

`}`

A palavra-chave  `class`  indica que estamos definindo uma classe chamada  **Person**. A implementação de uma classe é feita dentro das chaves. Apesar de a classe  `Person`  não ser muito útil em sua forma atual, é uma apropriada, classe funcional em Swift.

### Propriedades

Como na maioria das outras linguagens de programação orientadas a objetos, uma classe pode ter propriedades e métodos. No exemplo atualizado a seguir, definimos três propriedades:

-   `firstName`, uma propriedade variável do tipo  `String?`
-   `lastName`, uma propriedade variável do tipo  `String?`
-   `gender`  uma propriedade constante do tipo  `String`

1

2

3

4

5

`class` `Person {`

`var` `firstName: String?`

`var` `lastName: String?`

`let` `gender =` `"female"`

`}`

Como o exemplo demonstra, a definição de propriedades na definição de uma classe é muito similar a definição comum de variáveis e constantes. Usamos a palavra-chave  `var`  para definir uma propriedade variável e a palavra-chave  `let`  para definir uma propriedade constante.

As propriedades acima também são conhecidas como propriedades  _armazenadas_. Mais tarde nesta serie, vamos aprender sobre propriedades  _calculadas_. Como o nome indica, propriedades armazenadas são propriedades que são armazenadas pela instância da classe. Elas são muito similares as propriedades em Objective-C.

É importante observar que cada propriedade armazenada precisa ter um valor após a inicialização, ou ser definido como um tipo opcional. No exemplo acima, demos a propriedades  `gender`  um valor inicial  `"female"`. Isso informa ao Swift que a propriedade gender é do tipo  `String`. Mais tarde neste artigo, vamos dar uma olhada em inicialização com mais detalhe e explorar como ela se amarra com inicialização de propriedades.

Embora definimos a propriedade  `gender`  como uma constante, é possível trocar seu valor durante a inicialização da instância  `Person`. Uma vez que a instância foi inicializada, a propriedade  `gender`  não pode ser modificada ja que definimos a propriedade como uma propriedade constante com a palavra-chave  `let`. Isto se tornará mais claro neste artigo quando discutimos inicialização.

### Métodos

Podemos adicionar comportamento ou funcionalidade a nossa classe através de funções e métodos. Em muitas linguagens de programação, o termo métodos é usado em vez de função no contexto de classes e instâncias. A definição de um método é quase idêntica à definição de uma função. No próximo exemplo, definimos o método  `fullName`  na classe  `Person`.

01

02

03

04

05

06

07

08

09

10

11

12

13

14

15

16

17

18

19

`class` `Person {`

`var` `firstName: String?`

`var` `lastName: String?`

`let` `gender =` `"female"`

`func fullName() -> String {`

`var` `parts: [String] = []`

`if` `let` `firstName = self.firstName {`

`parts += [firstName]`

`}`

`if` `let` `lastName = self.lastName {`

`parts += [lastName]`

`}`

`return` `" "``.join(parts)`

`}`

`}`

O método fullName é encadeado na definição da classe. Ele não recebe parâmetros e retorna uma  `String`. A implementação do método  `fullName`  é simples. Através do optional binding, como discutimos  [mais cedo nesta serie](http://code.tutsplus.com/tutorials/swift-from-scratch-optionals-and-control-flow--cms-22874), acessamos os valores armazenados nas propriedades  `firstName`  e  `lastName`.

Armazenamos o primeiro e o segundo nome da instância  `Person`  em um array e juntamos as partes com um espaço. A razão para essa implementação um tanto estranha deveria ser óbvia, o primeiro e último nome pode estar em branco, é por isso que ambas as propriedades são do tipo  `String?`.

### Instanciação

Definimos uma classe com algumas propriedades e um método. Como criamos uma instância da classe  `Person`? Se você estiver familiarizado com o Objective-C, então você irá adorar a concisão do trecho a seguir.

1

`let` `john = Person()`

Instanciar uma instância de uma classe é muito semelhante a chamada de uma função. Para criar uma instância, o nome da classe é seguido por parênteses, o valor de retorno é atribuído a uma variável ou constante.

No nosso exemplo, a constante  `john`  agora aponta para uma instância da classe  `Person`. Isso significa que não podemos mudar qualquer uma de suas propriedades? O próximo exemplo responde a esta pergunta.

1

2

3

`john.firstName =` `"John"`

`john.lastName =` `"Doe"`

`john.gender =` `"male"`

Podemos acessar as propriedades de uma instância usando a conveniência da sintaxe de ponto. No exemplo, nos definimos `firstName`  com  `"John"`,  `lastName`  com  `"Doe"`  e  `gender`  com  `"male"`. Antes de tirar conclusões com base no exemplo acima, precisamos verificar se há erros no playground.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/23197/image/figure-properties-1.jpg)

Definir  `firstName`  e  `lastName`  parece não causar quaisquer problemas. Atribuir  `"male"`  para a propriedade de  `gender`, no entanto, resulta em um erro. A explicação é simples. Apesar de  `John` ser declarado como uma constante, que não nos impedem de modificar a instância de  `Person`. Há uma ressalva, somente propriedades variáveis podem ser modificadas após inicializar uma instância. Propriedades que são definidas como constante não podem ser modificadas _após_  a inicialização.

Observe que o eu enfatizei  _depois_  na frase anterior. Uma propriedade constante pode ser modificada durante a inicialização de uma instância. Embora a propriedade  `gender`  não pode ser mudada, uma vez que uma instância de  `Person`  foi criada, a classe não seria muito útil se nós só pudéssemos instanciar instâncias de `Person` do gênero feminino. Vamos fazer a classe  `Person`  ser um pouco mais flexível.

### Inicialização

Inicialização é um passo no ciclo de vida de uma instância de uma classe ou estrutura. Durante a inicialização, preparamos a instância para o uso, populando suas propriedades com valores iniciais. A inicialização de uma instância pode ser customizada através da implementação de um inicializador, um tipo especial de método. Vamos adicionar um inicializador na classe Person.

1

2

3

4

5

6

7

8

9

`class` `Person {`

`var` `firstName: String?`

`var` `lastName: String?`

`let` `gender =` `"female"`

`init() {`

`gender =` `"male"`

`}`

`}`

Note que o nome do inicializador,  `init`, não precede da palavra-chave  `func`. Em contraste com os inicializadores em Objective-C, um inicializador no Swift não retorna a instância que está sendo inicializada.

Outro detalhe importante é como podemos definir a propriedade  `gender`  com um valor inicial. Mesmo que a propriedade  `gender`  seja definida como uma propriedade constante, podemos definir seu valor no inicializador. Definimos a propriedade  `gender`  usando o nome da propriedade, mas também é bom para ser mais explícito e escrever o seguinte:

1

2

3

`init() {`

`self.gender =` `"male"`

`}`

No exemplo acima,  `self`  refere-se à instância que está sendo inicializada. Isso significa que  `self.gender`se refere à propriedade  `gender`  da instância. Podemos omitir o  `self`, como no primeiro exemplo, porque não há nenhuma confusão que estamos nos referindo a outra propriedade com o mesmo nome. Embora este não seja sempre o caso. Deixe-me explicar o que quero dizer.

#### Parametros

Em muitas situações, você precisa passar um valor inicial para o inicializador para personalizar a instância que você está inicializando. Isto é possível através da criação de um inicializador personalizado que aceita um ou mais argumentos. No exemplo a seguir criamos um inicializador personalizado que aceita um argumento,  `gender`, do tipo  `String`.

1

2

3

`init(gender: String) {`

`self.gender = gender`

`}`

Há duas coisas a se notar. Primeiro, somos obrigado a acessar a propriedade  `gender`  através de  `self.gender`  para evitar ambigüidade, uma vez que o nome local do parâmetro é igual a  `gender`. Em segundo lugar, mesmo que não especificamos um nome de parâmetro externo, o Swift por padrão cria um nome de parâmetro externo que é igual ao nome do parâmetro local. O resultado é o mesmo que se fôssemos iniciar o parâmetro  `gender`  com um símbolo  `#`.

No exemplo a seguir, podemos instanciar uma outra instância  `Person`  chamando o inicializador personalizado que acabamos de definir.

1

2

3

`let` `bart = Person(gender:` `"male"``)`

`println(bart.gender)` `// Outputs "male"`

Mesmo que o valor inicial da propriedade  `gender` seja definido como  `"female"`  na definição de classe, passando um valor para o parâmetro  `gender`  podemos atribuir um valor personalizado para a propriedade constante  `gender`  durante a inicialização.

#### Multiplos inicializadores

Como em Objective-C, uma classe ou estrutura pode ter múltiplos inicializadores. No exemplo a seguir, criamos duas instâncias de  `Person`. Na primeira linha, usamos o inicializador padrão. Na segunda linha, usamos o inicializador personalizado que definimos anteriormente.

1

2

`let` `p1 = Person()`

`let` `p2 = Person(gender:` `"male"``)`

## 4.  Definindo uma estrutura

Estruturas são surpreendentemente similares às classes, mas tem algumas diferenças importantes. Vamos começar definindo uma estrutura básica.

1

2

3

4

5

6

7

8

9

`struct Wallet {`

`var` `dollars: Int`

`var` `cents: Int`

`init() {`

`dollars = 0`

`cents = 0`

`}`

`}`

À primeira vista, a única diferença é o uso da palavra-chave  `struct`  em vez do palavra-chave  `class`. O exemplo também demonstra uma forma alternativa de fornecer valores iniciais as propriedades. Em vez de definir um valor inicial para cada propriedade, podemos dar as propriedades um valor inicial no inicializador da estrutura. O Swift não vai emitir erro, porque ele também inspeciona o inicializador para determinar o valor inicial — e tipo — de cada propriedade.

## 5.  Classes e Estruturas

Você pode começar a se perguntar qual é a diferença entre classes e estruturas. À primeira vista, eles parecem idênticos em forma e função, com exceção das palavras-chave  `class`  e  `struct`. Porém, existem algumas diferenças chaves.

### Herança

Classes oferecem suporte a herança, enquanto estruturas não. O exemplo a seguir ilustra isso. O padrão de design de herança é indispensável em programação orientada a objetos e, em Swift, isso é um diferença fundamental entre classes e estruturas.

01

02

03

04

05

06

07

08

09

10

11

12

13

14

15

`class` `Person {`

`var` `firstName: String?`

`var` `lastName: String?`

`let` `gender =` `"female"`

`init(gender: String) {`

`self.gender = gender`

`}`

`}`

`class` `Student: Person {`

`var` `school: String?`

`}`

`let` `student = Student(gender:` `"male"``)`

No exemplo acima, a classe  `Person`  é o pai ou superclasse da classe  `Student`. Isso significa que a classe  `Student`  herda as propriedades e comportamentos da classe  `Person`. A ultima linha demonstra isso. Inicializamos uma instância de  `Student`  chamando o inicializador padrão que definimos anteriormente na classe  `Person`.

### Copiando e referenciando

O conceito seguinte é provavelmente o mais importante conceito de Swift que você vai aprender hoje, a diferença entre  **valor**  e **tipos de referência**. Estruturas são tipos de valor, o que significa que eles são passados por valor. Um exemplo demonstra este conceito melhor.

01

02

03

04

05

06

07

08

09

10

11

12

13

14

15

16

17

`struct Point {`

`var` `x: Int`

`var` `y: Int`

`init(x: Int, y: Int) {`

`self.x = x`

`self.y = y`

`}`

`}`

`var` `point1 = Point(x: 0, y: 0)`

`var` `point2 = point1`

`point1.x = 10`

`println(point1.x)` `// Outputs 10`

`println(point2.x)` `// Outputs 0`

Definimos uma estrutura,  `Point`, para encapsular os dados para armazenar um coordenada de um espaço bidimensional. Estanciamos  `point1`  com  `x`  igual a  `0`  e  `y`  igual a  `0`. Atribuímos  `point1`  para  `point2`  e definimos a coordenada  `x`  do  `point1`  em  `10`. Se visualizarmos a coordenada  `x` de ambos na saída, descobriremos que eles não são iguais.

_Estruturas são passadas como valor, enquanto as classes são passadas como referência._  Se você pretende continuar a trabalhar com Swift, você precisa entender a afirmação anterior. Quando atribuímos  `point1` para `point2`, o Swift criou uma cópia de  `point1`  e atribuiu para `point2`. Em outras palavras,  `point1`  e  `point2`  apontam para uma instância diferente da estrutura  `Point`.

Vamos agora repetir este exercício com a classe  `Person`. No exemplo a seguir, podemos instanciar uma instância de  `Person`, definir suas propriedades, atribuir  `person1` para  `person2`  e atualizar a propriedade  `firstName`  da `person1`. Para ver o que passar como referência significa para as classes, vamos visualizar na saída o valor da propriedade  `firstName`  de ambas as instâncias de  `Person`.

01

02

03

04

05

06

07

08

09

10

11

`var` `person1 = Person(gender:` `"female"``)`

`person1.firstName =` `"Jane"`

`person1.lastName =` `"Doe"`

`var` `person2 = person1`

`person1.firstName =` `"Janine"`

`println(person1.firstName)`

`println(person2.firstName)`

O exemplo prova que as classes são tipos de referência. Isso significa que  `person1`  e  `person2`  referem ou referênciam à mesma instância  `Person`. Ao atribuir  `person1` para  `person2`, o Swift não cria uma cópia do  `person1`. A variável `person2` _aponta_  para a mesma instância de  `Person`  que  `person1`  está apontando. Alterar a propriedade  `firstName`  de  `person1` afeta a propriedade  `firstName`  de  `person2`, porque eles estão fazendo referência a mesma instância de  `Person`.
