-- luagotchi

local tamagotchi = {
    nome = "Tamagotchi",
    fome = 5,
    felicidade = 5,
    saude = 5,
    idade = 0,
}

-- função para limpar a tela

function limparTela()
    if package.config:sub(1,1) == '\\' then
        -- para windows
        os.execute("cls")
    else
        -- para linux/mac
        os.execute("clear")
    end
end


-- alimentar o tamagotchi

function alimentar()
    if tamagotchi.fome < 10 then
        tamagotchi.fome = tamagotchi.fome + 2
        print(tamagotchi.nome .. " foi alimentado!")
        else
        print(tamagotchi.nome .. " não tem fome no momento.")
    end
end

-- brincar com o tamagotchi

function brincar()
    if tamagotchi.felicidade < 10 then
        tamagotchi.felicidade = tamagotchi.felicidade + 2
        print("Você brincou com " .. tamagotchi.nome .. "!")
    else
        print(tamagotchi.nome .. " está muito feliz para brincar!")
    end
end

-- saúde do tamagotchi

function cuidarSaude()
    if tamagotchi.saude < 10 then
        tamagotchi.saude = tamagotchi.saude + 1
        print("Você cuidou da saúde de " .. tamagotchi.nome .. "!")
    else
        print(tamagotchi.nome .. " está saudável!")
    end
end

-- status do tamagotchi

function mostrarStatus()
    print("\nStatus do " .. tamagotchi.nome)
    print("Fome: " .. tamagotchi.fome)
    print("Felicidade: " .. tamagotchi.felicidade)
    print("Saúde: " .. tamagotchi.saude)
    print("Idade: " .. tamagotchi.idade)
end

-- função tamagotchi envelhecer

function envelhecer()
    tamagotchi.idade = tamagotchi.idade + 1
    tamagotchi.fome = tamagotchi.fome - 1
    tamagotchi.felicidade = tamagotchi.felicidade - 1
    tamagotchi.saude = tamagotchi.saude - 1
end


-- função tamagotchi morreu :(

function verificarMorte()
    if tamagotchi.fome >= 20 or tamagotchi.felicidade <= 0 or tamagotchi.saude <= 0 then
        print(tamagotchi.nome .. " morreu :( Cuidou mal dele!")
        return true
    end
        return false
end

-- função para interagir com o tamagotchi

function menu()
    while true do
        if verificarMorte() then
            break
        end

        -- limpar a tela
        limparTela()

        -- exibe o status atual do tamagotchi
        mostrarStatus()


        -- mostrar o menu de interações
        print("\nEscolha uma ação:")
        print("1 - Alimentar")
        print("2 - Brincar")
        print("3 - Cuidar da Saúde")
        print("4 - Passar um dia (Envelhecer)")
        print("0 - Sair")

        -- recebe uma opçao do usuario
        local opcao = tonumber(io.read())

        if opcao == 1 then
            alimentar()
        elseif opcao == 2 then
            brincar()
        elseif opcao == 3 then
            cuidarSaude()
        elseif opcao == 4 then
            envelhecer()
        elseif opcao == 0 then
            print("Saindo do Jogo. Até mais!!!")
            break
        else
            print("Opção inválida. Tente novamente!")
        end
    end
end

-- inicia o game
menu()