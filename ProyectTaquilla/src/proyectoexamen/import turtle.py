import turtle

def dibujar_petalos():
    turtle.color("red")
    turtle.fillcolor("red")
    turtle.begin_fill()

    for _ in range(18):
        turtle.forward(50)
        turtle.right(45)
        turtle.forward(50)
        turtle.right(135)

    turtle.end_fill()

def dibujar_tallo():
    turtle.color("green")
    turtle.width(5)
    turtle.right(90)
    turtle.forward(200)

def dibujar_flor():
    dibujar_petalos()
    dibujar_tallo()

def escribir_carta():
    turtle.penup()
    turtle.color("purple")
    turtle.goto(-150, 100)
    turtle.write("Querido [Nombre del Ser Amado],", font=("Arial", 16, "bold"))
    turtle.goto(-150, 70)
    turtle.write("Eres la flor más hermosa", font=("Arial", 14))
    turtle.goto(-150, 40)
    turtle.write("en el jardín de mi corazón.", font=("Arial", 14))
    turtle.goto(-150, 10)
    turtle.write("Con amor,", font=("Arial", 14, "italic"))
    turtle.goto(-150, -20)
    turtle.write("[Tu Nombre]", font=("Arial", 14, "italic"))

# Configurar la pantalla
turtle.bgcolor("pink")
turtle.title("Carta de Amor")

# Dibujar la flor y escribir la carta
dibujar_flor()
escribir_carta()

# Mostrar la pantalla
turtle.done()
