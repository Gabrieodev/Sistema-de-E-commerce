# 🛒 Sistema de E-commerce - Banco de Dados

## 📋 Descrição
Este projeto contém o banco de dados para um sistema de e-commerce que gerencia clientes, produtos, pedidos e promoções. A estrutura visa atender as necessidades de vendas online com um controle eficiente de perfis de clientes, endereços, promoções e pagamentos.

Este projeto foi desenvolvido durante minha graduação na faculdade, como parte das atividades acadêmicas para aplicar conceitos de modelagem de dados e programação de banco.

---

## 🗂️ Tabelas e Relacionamentos

### 👤 Cliente
- Armazena dados pessoais do cliente.
- Relacionamentos:
  - **Perfil_Cliente**: Define o tipo do cliente (conservador, moderado, arrojado).
  - **Endereço**: Cada cliente possui um endereço único.
  - **Pedido**: Um cliente pode realizar vários pedidos.

### 🛡️ Perfil_Cliente
- Define o tipo de cliente:
  - Conservador
  - Moderado
  - Arrojado

### 🏠 Endereço
- Armazena o endereço do cliente.
- Um cliente pode ter somente um endereço.

### 📦 Produto
- Pertence a uma **Categoria**.
- Pode estar vinculado a várias **Promoções**.

### 🗃️ Categoria
- Classificação dos produtos (ex: eletrônicos, roupas, etc.).

### 🎉 Evento_Especial
- Define datas comemorativas com promoções, por exemplo:
  - Black Friday
  - Natal

### 🧾 Pedido
- Relacionado a um cliente.
- Contém vários **Itens_Pedido**.
- Possui um **Pagamento** associado.

### 📋 Item_Pedido
- Representa cada produto comprado dentro de um pedido.

### 💳 Pagamento
- Contém:
  - Valor pago
  - Forma de pagamento
  - Status do pagamento

---

## ⚙️ Procedure para Atualizar Perfil do Cliente
Existe uma procedure criada para atualizar o perfil do cliente baseada em critérios de negócio específicos. Ela permite ajustar o tipo do cliente automaticamente.

## 📊 Diagrama do Banco de Dados

![Captura de tela 2025-05-22 203941](https://github.com/user-attachments/assets/523ec615-6273-4110-a7d1-a6df3b036e14)

---

## 🚀 Como Usar

Clone o repositório:

```bash
git clone https://github.com/seuusuario/seuprojeto.git

```

## 🙏 Agradecimentos

Gostaria de expressar minha sincera gratidão a todos que contribuíram para a realização deste projeto. 

Agradeço especialmente aos professores pela orientação e suporte ao longo do desenvolvimento, bem como aos colegas da faculdade pela colaboração e troca de conhecimentos.  

Este projeto não seria possível sem o apoio e incentivo de cada um de vocês. Muito obrigado!
