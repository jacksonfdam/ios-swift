//
//  ViewController.swift
//  exercicio0504
//
//  Created by Jackson on 01/06/2018.
//  Copyright © 2018 Targettrust. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let filemgr = FileManager.default
        var error: NSError?
        
        let arquivo01_nome:String = "arquivo01.txt"
        let arquivo01_novo_nome:String = "arquivo01_novo.txt"
        let arquivo02_nome:String = "arquivo02.txt"
        let arquivo02_novo_nome:String = "arquivo02_copia.txt"
        let arquivo03_nome:String = "arquivo03.txt"
        let documentsUrl = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        
        let arquivo01 = documentsUrl.first!.appendingPathComponent(arquivo01_nome)
        let arquivo01_novo = documentsUrl.first!.appendingPathComponent(arquivo01_novo_nome)
        let arquivo02 = documentsUrl.first!.appendingPathComponent(arquivo02_nome)
        let arquivo02_novo = documentsUrl.first!.appendingPathComponent(arquivo02_novo_nome)
        let arquivo03 = documentsUrl.first!.appendingPathComponent(arquivo03_nome)
        
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        
        
        
        print("Path : \(paths[0])")
        
        guard documentsUrl.count != 0 else {
            return // Could not find documents URL
        }
        
        copyFileIfNeeded(arquivo: arquivo01_nome)
        copyFileIfNeeded(arquivo: arquivo02_nome)
        copyFileIfNeeded(arquivo: arquivo03_nome)
        
        
        
        if filemgr.fileExists(atPath: arquivo01.path) {
            print("Existe")
        } else {
            print("Não existe")
        }
        
        /* Comparing the Contents of Two Files */
        if filemgr.contentsEqual(atPath: arquivo01.path, andPath: arquivo02.path) {
            print("Arquivos são iguais")
        } else {
            print("Arquivos não são iguais")
        }
        
        /* Checking if a File is Readable/Writable/Executable/Deletable */
        if filemgr.isWritableFile(atPath: arquivo01.path) {
            print("Arquivo é gravavel")
        } else {
            print("Arquivo somente para leitura")
        }
        
        
        /* Moving/Renaming a File */
        do{
            try filemgr.moveItem(atPath: arquivo01.path, toPath: arquivo01_novo.path)
            print("Arquivo renomeado com sucesso")
        } catch {
            print("Falha ao renomear '\(arquivo01)' para '\(arquivo01_novo)'. Erro: \(error.localizedDescription)")
        }
        
        /* Copying a File */
        
        do{
            try filemgr.copyItem(atPath: arquivo02.path, toPath: arquivo02_novo.path)
            print("Arquivo copiado com sucesso")
        } catch {
            print("Falha ao copiar '\(arquivo02)' para '\(arquivo02_novo)'. Erro: \(error.localizedDescription)")
        }
        
        /* Removing a File */
        
        do {
            try filemgr.removeItem(atPath: arquivo02_novo.path)
            print("Arquivo excluido com sucesso")
        } catch{
            print("Falha ao excluir '\(arquivo02_novo)'. Erro: \(error.localizedDescription)")
        }
        
        /* Reading and Writing Files with NSFileManager */
        let databuffer = filemgr.contents(atPath: arquivo01.path)
        filemgr.createFile(atPath: arquivo03.path, contents: databuffer, attributes: nil)
        
        /* Creating an FileHandle Object */
        let arquivo03Copia: FileHandle? = FileHandle(forReadingAtPath: arquivo03.path)
        if arquivo03Copia == nil {
            print("Arquivo aberto com sucesso")
        } else {
            arquivo03Copia?.closeFile()
        }
        
        
        let novo_texto = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam quis metus sit amet justo hendrerit malesuada eu nec orci. Proin faucibus malesuada tempor. Praesent sit amet pulvinar eros. Donec eget pulvinar urna, eget auctor orci. Nunc nunc ipsum, tincidunt iaculis dictum vel, vestibulum vel arcu. Sed imperdiet, quam ut blandit faucibus, justo enim suscipit felis, eget ultricies sapien enim sed metus. Aliquam pretium quam id congue scelerisque."
        
        /* gravando */
        let arquivo_03_nov_copia = documentsUrl.first!.appendingPathComponent("arquivo_03_nov_copia.txt")
        do {
            try novo_texto.write(to: arquivo_03_nov_copia, atomically: false, encoding: .utf8)
             print("Arquivo arquivo_03_nov_copia gravado com sucesso")
        } catch {
            print("Falha ao gravar '\(arquivo03Copia)'. Erro: \(error.localizedDescription)")
        }
        
        /* lendo */
        do {
            let texto_novo = try String(contentsOf: arquivo_03_nov_copia, encoding: .utf8)
            print("Arquivo arquivo_03_nov_copia aberto com sucesso: \(texto_novo)")
        } catch {
            print("Falha ao ler '\(arquivo03Copia)'. Erro: \(error.localizedDescription)")
        }
        
        let path = Bundle.main.path(forResource: "arquivo03", ofType: "txt")
        do {
            let text = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
             print("Arquivo arquivo03.txt do Bundle aberto com sucesso: \(text)")
        } catch {
            print("Falha ao ler '\(path)'. Erro: \(error.localizedDescription)")
        }
    
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


func copyFileIfNeeded(arquivo:String) {
    let fileManager = FileManager.default
    let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
    
    guard documentsUrl.count != 0 else {
        return
    }
    
    let finalURL = documentsUrl.first!.appendingPathComponent(arquivo)
    
    if !( (try? finalURL.checkResourceIsReachable()) ?? false) {
        print("Não existe o arquivo na pasta de Documentos")
        let documentsURL = Bundle.main.resourceURL?.appendingPathComponent(arquivo)
        do {
            try fileManager.copyItem(atPath: (documentsURL?.path)!, toPath: finalURL.path)
        } catch let error as NSError {
            print("Falha ao copiar '\((documentsURL?.path)!)' para '\(finalURL.path)'. Erro: \(error.localizedDescription)")
        }
        
    } else {
        print("Arquivo está em: \(finalURL.path)")
    }
    
}






}

