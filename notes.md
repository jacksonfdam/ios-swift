
# Anotações e Links


Swift vs C#
[https://medium.com/@lucasdamiani/swift-vs-c-6dbc35944cd9](https://medium.com/@lucasdamiani/swift-vs-c-6dbc35944cd9)

Memory Leaks in Swift
[https://medium.com/flawless-app-stories/memory-leaks-in-swift-bfd5f95f3a74](https://medium.com/flawless-app-stories/memory-leaks-in-swift-bfd5f95f3a74)

Lazy Initialization with Swift
[http://mikebuss.com/2014/06/22/lazy-initialization-swift/](http://mikebuss.com/2014/06/22/lazy-initialization-swift/)

Interfaces vs Inheritance in Swift
[http://mikebuss.com/2016/01/10/interfaces-vs-inheritance/](http://mikebuss.com/2016/01/10/interfaces-vs-inheritance/)


## Swift4 Syntax Cheat Sheet


### Variáveis/Constantes

```swift
	var myVariable:DataType
	let myConstant:DataType
```

### Classes

```swift
	class minhaClasse:ASuperclasse {

	}

```

### Declarações IF

```swift
	if condition {

	} else if condition {

	} else {

	}

```

### Switch

```swift

	switch valor {
		case condicao1:
		case condicao2:
		default:
	}


```

### Laços

```swift
	for variable in lower...upper {

	}

	while condition {

	}

	repeat {

	} while condition

```

### Data Types

```swift
	String
	Int
	Bool
	Double
	Float
	Character

```

### Funções

```swift
	func minhaFuncao(primeiroArgumento:DataType) -> ReturnType {
	}

```


## Optionals

Por padrão, nenhum objeto em Swift pode ser nulo (ou  _nil_, como é chamado em Swift), a não ser que você diga que ele pode ser nulo. Neste caso, seu objeto muda de tipo e se torna um  _Optional< SeuTipoAqui >_.

## Lazy Stored Properties

Nem sempre você pode inicializar uma propriedade na construção do objeto. Por exemplo, se o seu objeto utiliza um recurso limitado do sistema (rede, memória, etc) através de uma propriedade, vale a pena você inicializar esta propriedade apenas quando você realmente for usá-la. Para isto existe o conceito de  _Lazy Stored Properties_, que é basicamente uma propriedade que roda o seu código de inicialização apenas quando ela é acessada pela primeira vez. Você pode ver mais detalhes  [neste link](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID254).


# Controles de Acesso  - Swift

O Swift 3 nos trouxe algumas mudanças de controle de acesso interessantes. As diferenças entre open, public, internal, private e fileprivate pode levar algum tempo para se acostumar com eles. Felizmente as novas regras são simples. Aqui está o que você precisa saber:

### São 5 níveis de acesso

Existem cinco níveis de acesso que controlam, a partir de qual arquivo de origem ou módulo você pode acessar alguma coisa. Abaixo segue uma breve descrição de cada nível:

-   **open :** Você pode usar o “open” para acessar as class e os membros de class a partir de  **qualquer arquivo de origem** (.swift) no módulo de definição ou de qualquer módulo que importa esse módulo. Você pode ter um “open” na  **subclass** ou ter o  **override open**  na class ou a própria class como open, tanto dentro de seu módulo de definição ou de  **qualquer módulo**  que importa esse módulo.
-   **public :** Permite que o mesmo acesso que “**open”,**  qualquer arquivo de origem em qualquer módulo, mas tem  **subclass e o override mais restritivo**. Você só pode acessar de uma subclass uma public class de dentro do mesmo módulo. Um membro de “public” class só pode ser substituído por uma subclass no mesmo módulo. Isto é importante se você estiver escrevendo um framework.  **Se você quiser que um usuário deste framework seja capaz de acessar uma subclass, uma class ou um método override você deve utilizar “**open**”.**
-   **internal:** permite o uso de qualquer arquivo de origem no módulo de definição, mas não de fora desse módulo. Este é geralmente o nível de acesso padrão.
-   **fileprivate:**  Permite o uso somente dentro do arquivo de origem definindo.
-   **private:**  Permite utilizar apenas a partir da declaração de inclusão.

> Note-se que as classes Objective-C e métodos agora são importados como “open”

### Não vamos entrar em pânico

Vale a pena lembrar que uma aplicação é um módulo e que o “internal” é o acesso padrão. Isso significa que o código do aplicativo que você escreveu é acessível a partir de todos os arquivos de origem do aplicativo por padrão.

Se você está desenvolvendo um framework, você provavelmente só precisa pensar sobre os níveis de acesso quando você quiser restringir o acesso a um único arquivo de origem usando “fileprivate” ou “private”.

### Usando fileprivate e private

Vejamos alguns exemplos onde se pode querer usar fileprivate e private. Suponha que eu tenho uma ViewController que tem uma propriedade que eu não quero que seja acessado de fora do arquivo de origem (.swift). Se fosse em Swift 2 utilizaríamos para declarar como private. Abaixo segue um exemplo:

```swift
class RootViewController: UIViewController {
  private var flag = false
}
```

Infelizmente, usando Swift 3, se eu agora tentar acessar esta variável a partir de uma extensão da classe ViewController, no mesmo arquivo de origem, teremos um problema de acesso:

```swift
extension RootViewController: MyGreatDelegate {
  func doSomething {
    if flag {
      // do the thing
    }
  }
}
```

// Use of unresolved identifier 'flag'

O problema é que o nível de acesso “private” restringe o acesso a somente até “class” da declaração. Na “extension” não é permitido o acesso mesmo que seja no mesmo arquivo de origem. A solução é muito simples, basta mudar o nível de acesso para  **fileprivate**:

```swift
class RootViewController: UIViewController {
  fileprivate var flag = false
}
```

Outro exemplo usando “private” é usar na “extension” para os métodos que você não quer que sejam acessados fora da “extension”, por exemplo, métodos auxiliares para um delegate:

```swift
extension RootViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    handle(text: textField.text)
    textField.resignFirstResponder()
    return true
  }

  // Não é acessível fora da extension
  private func handle(text: String?) {
    // do something
  }
}
```

### Uma dica*

#### Getters e setters

Você pode utilizar um setter com um acesso inferior ao seu getter para limitar o acesso de leitura e escrita.

```swift
class MyDataSource {
  // flag é somente leitura fora desta class
  private(set) var flag = false

  // ...
}
```

Por padrão, a propriedade getter e setter, neste exemplo, tem um acesso “internal”. Fazendo o setter ter um acesso de nível “private” isso significa que só pode configurá-lo dentro da classe que ela foi definida não podendo defini-la a partir de outro arquivo de origem (.swift) ou de uma “extension” da class no mesmo arquivo de origem. Se quiséssemos extender o acesso desta propriedade teríamos que definir o acesso como fileprivate setter:

```swift
fileprivate(set) var flag = false
```

#### Unit Test Targets

Teste Unitário tem o seu próprio módulo, de modo que você não tem acesso a quaisquer tipos ou propriedades no módulo de aplicação que são por padrão de acesso “internal”. Mas para acessar você pode adicionar aos seus testes o atributo  **@testable**:

```swift
import XCTest
**@testable** import MyDataSource
class MyDataSourceTests: XCTestCase {
  // func testSomething() {...}
}
```

> **Nota**

> A palavra-chave  **final** não é um nível de acesso, mas pode adicioná-lo a qualquer um dos níveis de acesso (além de “open”) para evitar a criação de uma  **subclass**do tipo ou a utilização de um  **override**.


