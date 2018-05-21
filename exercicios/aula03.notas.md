## Configuração do projeto

### Passo 1: Escolha um template

Iniciar o Xcode 6.3 ou superior e selecione  **New > Project**... no menu  **File**. Na lista de modelos de  **iOS Application**, escolha o modelo  **Single View Application**  e clique em  **Next**.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/23334/image/figure-project-setup-1.jpg)

### Step 2: Configurar o projeto

Nomeie o projeto de **ToDo**  e selecionar  **Swift**  em  **Language**. Certifique-se de que o  **Devices** está definido como **iPhone**  e a opção  **Use Core Data**  está desmarcada. Clique em  **Next**  para continuar.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/23334/image/figure-project-setup-2.jpg)

Diga ao Xcode onde você gostaria de armazenar o seu projeto e clique em  **Create**  no canto inferior direito para criar seu primeiro projeto Swift.

## 2.  Anatomia do projeto

Antes de continuarmos nossa jornada no Swift, vamos olhar um momento para o que o Xcode criou para nós. Se você é novo no Xcode e no desenvolvimento em iOS, a maior parte disto será novo para você. Trabalhando com um projeto Swift, no entanto, você obterá um melhor entendimento de como classes e estruturas parecem e se comportam em Swift.

O modelo de projeto não difere muito de um projeto criado com o Objetivo-C como linguagem de programação. As diferenças mais importantes estão relacionadas com as classes  `AppDelegate`  e  `ViewController`.

Se você trabalhou com Objective-C, no passado, então você vai notar que o modelo de projeto contém menos arquivos. Não há arquivos de cabeçalhos (**.h**) ou de implementação (**.m**) em nosso projeto. No Swift, classes não têm nenhum arquivo de cabeçalho separado em que a interface é declarada. Em vez disso, uma classe é declarada e implementada em um arquivo único  **.swift**.

Nosso projeto atualmente contém dois arquivos Swift, um para a classe de  `AppDelegate`,  **AppDelegate.swift**, e outro para a classe  `ViewController`,  **ViewController.swift**. O projeto também inclui um storyboard,  **Main.storyboard**, e um arquivo XIB para a tela de inicialização,  **LaunchScreen.xib**. Nós vamos trabalhar com o storyboard um pouco mais tarde neste artigo. No momento contém apenas a tela para a classe ViewController.

Há uma série de outros arquivos e pastas incluídas no projeto, mas nós vamos ignorá-los por enquanto. Eles não tem nenhum papel importante no escopo deste artigo.

## 3. Herança

A primeira coisa que vou abordar neste artigo é herança, um paradigma comum em programação orientada a objeto. Em Swift, apenas classes podem herdar de outra classe. Em outras palavras, estruturas e enumerações não oferecerem suporte a herança. Esta é uma das principais diferenças entre as classes e estruturas.

Abra o  **ViewController.swift**  para ver a herança em ação. A interface e a implementação da classe  `ViewController` são bonitas em branca, o que torna mais fácil para nós se concentrar no essencial.

### UIKit

Na parte superior do  **ViewController.swift**, você deve ver uma instrução de importação para o framework UIKit. Lembre-se que o framework UIKit fornece a infra-estrutura para criar um aplicativo iOS funcional. A instrução de importação na parte superior torna esta infraestrutura disponível para nós em  **ViewController.swift**.

1

`import` `UIKit`

### Superclasse

Abaixo da instrução de importação, definimos uma nova classe denominada  **ViewController**. Os dois pontos após o nome da classe não significa  _é do tipo_, como vimos no início desta série. Em vez disso, a classe após os dois pontos é a superclasse da classe  `ViewController`. Em outras palavras, o trecho a seguir poderia ser lido como  _definimos uma classe chamada  `ViewController`  que herda  `UIViewController`._

1

2

3

`class` `ViewController: UIViewController {`

`}`

Isso também explica a presença da declaração de importação na parte superior do  **ViewController.swift**, ja que a classe  `UIViewController`  é definida no framework UIKit.

### Overrides

A classe  `ViewController`  atualmente inclui dois métodos, mas observe que cada método é iniciado com a palavra-chave  `override`. Isto indica que os métodos são definidos na superclasse da classe — ou nível superior na árvore de herança — e são substituídas pela classe  `ViewController`.

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

`class` `ViewController: UIViewController {`

`override func viewDidLoad() {`

`super``.viewDidLoad()`

`}`

`override func didReceiveMemoryWarning() {`

`super``.didReceiveMemoryWarning()`

`}`

`}`

O construtor  `override`  não existe em Objective-C. Em Objective-C, você implementa um método substituto em uma subclasse sem indicar explicitamente que está substituindo um método do nível superior na árvore de herança. O Objective-C se encarrega em tempo real do resto.

O mesmo acontece em Swift, mas as palavras-chave  `override`  adiciona segurança para substituir o método. Como nós iniciamos o método  `viewDidLoad`  com o palavra-chave  `override`, o Swift espera esse método na superclasse da classe ou no nível superior na árvore de herança. Simplificando, se você substituir um método que não existe na árvore de herança, o Swift emitirá um erro. Você pode testar isso digitando incorretamente o método  `viewDidLoad`  como mostrado abaixo.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/23334/image/figure-overrides-1.jpg)

## 4.  Interface de usuário

### Declarando outlets

Vamos adicionar uma table view na view controller para exibir a lista dos itens de tarefas. Antes de fazermos isso, precisamos criar um outlet para a table view. Um outlet nada mais é do que uma propriedade que é visível e pode ser definida no Interface Builder. Para declarar um outlet na classe  `ViewController`, iniciamos a propriedade, uma variável, com o atributo  `@IBOutlet`.

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

`class` `ViewController: UIViewController {`

`@IBOutlet` `var` `tableView: UITableView!`

`override func viewDidLoad() {`

`super``.viewDidLoad()`

`}`

`override func didReceiveMemoryWarning() {`

`super``.didReceiveMemoryWarning()`

`}`

`}`

Observe que o outlet é um desempacotamento implícito de opcional. O quê? Deixe-me começar dizendo que um outlet sempre precisa ser do tipo opcional. A razão é simples. Cada propriedade da classe  `ViewController`  precisa ter um valor após a inicialização. Um outlet, no entanto, está apenas ligada à interface de usuário em tempo de execução após a instância `ViewController` ter sido inicializado, portanto, o tipo opcional.

Espere um minuto. O outlet  `tableView`  é declarada como um desempacotamento implícito de opcional, não um opcional. Sem problema. Podemos declarar a outlet `tableView` como um opcional, substituindo o ponto de exclamação no trecho acima, com um ponto de interrogação. Isso iria compilar bem. No entanto, isso significaria também que precisamos desempacotar explicitamente a propriedade toda vez que quisermos acessar o valor armazenado no opcional. Isso rapidamente vai se tornar complicado e trabalhoso.

Ao invés, declaramos o outlet tableView como um desempacotamento implícito de opcional, o que significa que não precisamos desempacotar explicitamente o opcional se precisarmos acessar seu valor. Resumindo, um desempacotamento implícito de opcional não é um opcional, mas podemos acessar o valor armazenado no opcional como uma variável normal. Uma coisa importante a ter em mente é que seu aplicativo irá falhar se você tentar acessar o seu valor se nenhum valor tiver sido definido. Isso é uma pegadinha. Se o outlet está conectada corretamente, no entanto, podemos ter certeza de que o outlet esta definido quando tentarmos acessa-lo.

### Conectando outlets

Com o outlet declarado, é hora de conecta-lo no Interface Builder. Abra o  **Main.storyboard**  e selecione a view controller. Escolha  **Embed In > Navigation Controller**  no menu  **Editor**. Isto irá definir a view controller como a view controller raiz de um navigation controller. Não se preocupe com isso agora.

Arraste uma instância da  `UITableView`  da  **Object Library**  para a view da view controller e adicione as restrições (constraints) de layout necessárias. Com a table view selecionada, abra o  **Connections Inspector**  e defina os outlets  `dataSource`  e  `delegate`  para o view controller.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/23334/image/figure-user-interface-1.jpg)

Com o  **Connections Inspector**  ainda aberto, selecione a view controller e conecte o outlet  `tableView`  na table view que acabamos de adicionar. Isto irá conectar o outlet  `tableView`  da classe  `ViewController`com a table view.

## 5.  Protocolos

Antes de podermos compilar e rodar o aplicativo, precisamos implementar os protocolos  `UITableViewDataSource`  e  `UITableViewDelegate`  na classe  `ViewController`. Isso envolve várias coisas.

### Passo 1: Em conformidade com protocolos

Precisamos falar ao compilador que a classe  `ViewController` está em conformidade com os protocolos `UITableViewDataSource`  e `UITableViewDelegate`. A sintaxe é semelhante a do Objective-C.

1

2

3

`class` `ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {`

`...`

`}`

Os protocolos que a classe está em conformidade estão listados após a superclasse,  `UIViewController`no exemplo acima. Se uma classe não tem uma superclasse, que não é incomum em Swift, então os protocolos são listados imediatamente após o nome da classe e o dois pontos.

### Passo 2: Implementando o protocolo  `UITableViewDataSource`

Devido ao protocolo  `UITableViewDelegate`  não definir métodos obrigatórios, só iremos implementar o protocolo `UITableViewDataSource`. Antes de fazermos, vamos criar uma propriedade variável para armazenar os itens de tarefas que vamos listar na table view.

1

2

3

4

5

6

7

`class` `ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {`

`@IBOutlet` `var` `tableView: UITableView!`

`var` `items: [String] = []`

`...`

`}`

Declaramos uma variável  `items`  do tipo  `[String]`  e definimos um array vazio,  `[]`, como valor inicial. Isto deve parecer familiar. Agora, vamos implementar dois métodos obrigatórios do protocolo  `UITableViewDataSource`.

O primeiro método obrigátorio,  `numberOfRowsInSection(_:)`, é fácil. Nós simplesmente retornamos o número de itens armazenados na propriedade  `items`.

1

2

3

`func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {`

`return` `self.items.count`

`}`

O segundo método obrigatório,  `cellForRowAtIndexPath(_:)`, precisa de um pouco mais de explicação. Usando a sintaxe subscrito, pegamos o item correto do conjunto de itens de tarefas.

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

`func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {`

`// Fetch Item`

`let` `item = self.items[indexPath.row]`

`// Dequeue Table View Cell`

`let` `tableViewCell = tableView.dequeueReusableCellWithIdentifier(``"TableViewCell"``, forIndexPath: indexPath) as! UITableViewCell`

`// Configure Table View Cell`

`tableViewCell.textLabel?.text = item`

`return` `tableViewCell`

`}`

Então pedimos à table view por uma célula com o identificador  `"TableViewCell"`, passando o caminho do índice da linha atual. Note que armazenamos a célula em uma constante chamada  `tableViewCell`. Não há necessidade de declarar a `tableViewCell`  como uma variável.

Outro detalhe importante é fazermos um downcast no valor de retorno de  `dequeueReusableCellWithIdentifier(_:forIndexPath:)`  para  `UITableViewCell`, uma vez que retorna um objeto do tipo  `AnyObject`, que é equivalente a  `id`  em Objective-C. Para fazer o downcast de  `AnyObject`para  `UITableViewCell`, usamos a palavra-chave  `as`.

Podemos usar a variante  `as?` para o downcast de um tipo opcional, mas desde que tenhamos certeza de que  `dequeueReusableCellWithIdentifier(_:forIndexPath:)`  sempre retorna uma instância corretamente inicializada, podemos usar a palavra-chave  `as?`, para desempacotar implicitamente o resultado da chamada do método.

Na próxima linha de código, configuramos a table view cell, definindo o texto da text label com o valor do  `item`. Note que em Swift a propriedade  `textLabel`  da  `UITableViewCell`  é declarada como um tipo opcional por isso o ponto de interrogação. Esta linha de código pode ser lida como  _definir o  `texto`  da propriedade text label com  `item`  se o  `textLabel`  não for igual a  `nil`_. Em outras palavras, o  `texto`  da propriedade text label apenas é definido se o  `textLabel`  não for igual a  `nil`. Isto é um construtor de segurança muito conveniente em Swift, conhecido como  **encadeamento opcional (opcional chaining)**.

### Passo 3: Reuso de celula

Há duas coisas que precisamos resolver antes de criar o aplicativo. Primeiro, precisamos informar a table view o que ela precisa para usar a classe  `UITableViewCell`  para criar novas células da table view. Fazemos isto invocando  `registerClass(_:forCellReuseIdentifier:)`, passando a classe  `UITableViewCell`e o identificador de reutilização que usamos anteriormente,  `"TableViewCell"`. Atualize o método  `viewDidLoad`  como mostrado abaixo.

1

2

3

4

5

6

`override func viewDidLoad() {`

`super``.viewDidLoad()`

`// Register Class for Cell Reuse`

`self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier:` `"TableViewCell"``)`

`}`

### Passo 4: Adicionando items

Atualmente não temos nenhum item para mostrar na table view. Isso é facilmente resolvido populando a propriedade  `items`  com alguns itens de tarefas. Existem várias maneiras de conseguir isso. Eu escolhi em popular a propriedade  `items`  no método  `viewDidLoad` como mostrado abaixo.

1

2

3

4

5

6

7

8

9

`override func viewDidLoad() {`

`super``.viewDidLoad()`

`// Populate Items`

`self.items = [``"Buy Milk"``,` `"Finish Tutorial"``,` `"Play Minecraft"``]`

`// Register Class for Cell Reuse`

`self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier:` `"TableViewCell"``)`

`}`

## 6.  Compilar e rodar

É hora de levar o nosso aplicativo para dar uma volta. Selecione  **Run** no menu  **Product** do Xcode ou aperte  **Command-R**. Se você seguiu tudo até aqui e você estiver usando o Swift 1.2, você deve acabar com o seguinte resultado.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/23334/image/figure-result-1.jpg)

Note que adicionei um título,  **To Do**, na parte superior da view na barra de navegação. Você pode fazer o mesmo, definindo a propriedade `title` da instância  `ViewController` no método  `viewDidLoad`.

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

`override func viewDidLoad() {`

`super``.viewDidLoad()`

`// Set Title`

`self.title =` `"To Do"`

`// Populate Items`

`self.items = [``"Buy Milk"``,` `"Finish Tutorial"``,` `"Play Minecraft"``]`

`// Register Class for Cell Reuse`

`self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier:` `"TableViewCell"``)`

`}`