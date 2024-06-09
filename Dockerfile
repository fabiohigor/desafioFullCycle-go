# Use a imagem oficial do Go como base
FROM golang:1.22.3 AS builder

# Copie o código fonte para dentro do contêiner
WORKDIR /app
COPY . .

# Compile o código
RUN go mod init desafio
RUN go build -o fullcycle

# Crie uma imagem mínima do Alpine para executar o binário
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/fullcycle .

# Execute o binário quando o contêiner for iniciado
CMD ["./fullcycle"]