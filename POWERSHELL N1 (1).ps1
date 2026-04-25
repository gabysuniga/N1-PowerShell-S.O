$escolha
while ($escolha -ne 11) {
    Clear-Host
    Write-Host " ======================================================= "
    Write-Host " [1] numeros antecessor e sucessor"
    Write-Host " [2] rendimento do aluno"
    Write-Host " [3] abrir processos customizaos"
    Write-Host " [4] listar processos custumizados"
    Write-Host " [5] inicial navegador Edge"
    Write-Host " [6] finalizar processos por ID"
    Write-Host " [7] finalizar processos por nome"
    Write-Host " [8] verificar se um processo está rodando"
    Write-Host " [9]  listar serviços do sistema operacionais parados"
    Write-Host " [10] Listar os 20 processos que ocupam mais memoria RAM"
    Write-Host " [11] sair do Script"
    Write-Host "========================================================="

    $escolha = Read-Host "selecione uma opção (1 - 11)"
    switch ($escolha) {
        1 { 
            
            Write-Host "saiba o  antecessor e sucessor de um núemro" -foregroundcolor cyan
            $numero = [int](Read-Host "digite um número ")
            $antecessor = ($numero -1)
            $sucessor = ($numero +1)
            Write-Host "Antecessor: $antecessor, Sucessor: $sucessor" -foregroundcolor blue
            Read-Host "pressione Enter para retornar ao menu"



        }
        2{
            $nomeAluno = Read-Host "Digite o nome do aluno" 
            $nota1 = [double](Read-host "digite a primeira nota") 
            $nota2 = [double] (Read-Host "digite a segunda nota")
            $media = ($nota1 + $nota2) / 2
            if ($media -lt 4){
                $situacao = "REPROVADO"
                $cor = "red"

            }
            elseIf ($media -ge 4 -and $media -lt 6) {
                    $situacao = "EXAME"
                    $cor = "yellow"

                    
            }
            else {
                 $situacao = "APROVADO"
                 $cor = "green"   
            }
            write-host "~~~~ RESULTADO FINAL ~~~~~"
            write-Host "Aluno: $nomeAluno" -foregroundcolor DarkCyan
            write-host "média: $media" -foregroundcolor Darkcyan
            write-host "situação: $situacao" -foregroundcolor $cor
            write-host "~~~~~~~~~~~~~~~"
            Read-Host "pressione Enter para voltar para o menu"

        }
        
        3 {
            $novoProc = read-host "digite o nome do processo"
            try{
                start-process $novoProc -ErrorAction stop
                write-host "$novoProc iniciado!"   -foregroundcolor darkGreen
                }
                 catch {
                    write-host "erro ao abrir o processo $novoProc"  -foregroundcolor darkRed
                }
                Start-Sleep -Seconds 3
                    
            }
            4 {
                $filtro = read-host "digite o nome do processo"
                write-host "Listando processos...." -foregroundcolor magenta
                Get-Process "$filtro*" | Select-Object Name, Id, CPU -first 10 | Format-Table -AutoSize
                Read-host "pressione Enter para retornar ao  menu"
            }
            5 {
                write-host "Iniciando Edge..." -foregroundcolor blue
                start-process "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
                Start-Sleep -Second 5
                
            }
            6 {
                $ID = read-host "digite ID para que o processo seja encerrado" 
                stop-process $ID -ErrorAction stop
                write-host "encerrando..." -foregroundcolor black
                start-sleep -second 3


            }
            7{
                $nome = read-host "digite o Nome do processo para que seja encerrado"
                stop-process -name $nome -force  
                write-host "$nome está encerrando" -foregroundcolor black
                start-sleep -second 3
                

            }
            8 {
                $nome = Read-Host "digite nome do processo"
               $verificar = Get-Process $verificar -ErrorAction SilentlyContinue
                if($verificar){
                    Write-Host "$nome  está rodando" -ForegroundColor Green
                } else{
                        Write-Host "$nome não está rodando!" -ForegroundColor DarkRed
                     }
                  start-sleep -second 3
                

            }
            9 {
                write-host "listando processos parados..." -foregroundcolor black
                get-service | where-object {$_.status -eq "stopped"}
                read-host "pressione Enter para voltar ao menu"
                    
               } 
               10 {
                    write-host "listando..." -foregroundcolor magenta
                    get-process | select-object name, Id, WS  -first 20 | Format-Table -AutoSize
                    read-host "pressione Enter para voltar ao menu"

               }
               11 {
                    write-host "encerrando o Script..." -foregroundcolor magenta
                    }
                    default {
                        write-host "opção invalida!!" -foregroundcolor darkred
                        start-sleep -second 4
                        }
            


                
                
                 
                
            
                
            
                
        }
        
        
        
        








    }