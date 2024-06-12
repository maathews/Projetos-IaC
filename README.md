## Projetos de Infraestrutura como Código (IaC)

## Introdução
O Vagrant é uma ferramenta para criar e gerenciar ambientes virtuais de desenvolvimento. Ele permite que você configure um ambiente de desenvolvimento consistente, independente do sistema operacional que você esteja utilizando. Este guia irá mostrar como configurar o Vagrant para criar uma máquina virtual (VM) usando VirtualBox como provedor.

Pré-requisitos
VirtualBox instalado.
Vagrant instalado.
Passos para Configuração

1. Instalar o VirtualBox
Baixe e instale o VirtualBox a partir do site oficial: VirtualBox Downloads. Siga as instruções do instalador para completar a instalação.

2. Instalar o Vagrant
Baixe e instale o Vagrant a partir do site oficial: Vagrant Downloads. Siga as instruções do instalador para completar a instalação.

3. Criar um Diretório para o Projeto
Abra um terminal ou prompt de comando e crie um diretório para o seu projeto Vagrant:

mkdir meu_projeto_vagrant
cd meu_projeto_vagrant

4. Inicializar o Vagrant
Dentro do diretório do projeto, inicialize um novo ambiente Vagrant:
vagrant init hashicorp/bionic64
Este comando cria um arquivo chamado Vagrantfile no diretório atual. O Vagrantfile contém a configuração da VM.

5. Configurar o Vagrantfile
Abra o Vagrantfile em um editor de texto. Por padrão, ele está configurado para usar a box hashicorp/bionic64. Você pode ajustar as configurações conforme necessário. Aqui está um exemplo básico de um Vagrantfile configurado:


Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"

  ### Configurações de rede
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", type: "dhcp"

  ### Configurações de provisionamento
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y apache2
  SHELL

  ### Configurações de sincronização de pasta
  config.vm.synced_folder ".", "/vagrant_data"

end
6. Iniciar a Máquina Virtual
Com o Vagrantfile configurado, inicie a VM:
vagrant up
Este comando faz o download da box especificada (se necessário) e configura a VM de acordo com as instruções no Vagrantfile.

7. Acessar a Máquina Virtual
Para acessar a máquina virtual via SSH:
vagrant ssh

8. Parar e Destruir a Máquina Virtual
Para parar a VM:
vagrant destroy

### Conclusão
Você configurou com sucesso um ambiente de desenvolvimento usando Vagrant e VirtualBox. Agora você pode personalizar o Vagrantfile conforme necessário para atender às necessidades específicas do seu projeto. Para mais informações, consulte a 
