function main()
    println("Hola Mundo")

    mi_diccionario = Dict("nombre" => "Juan", "apellido" => "Pérez", "edad" => 15, :Δ => "Hola")
    println(mi_diccionario)

    for (clave, valor) in mi_diccionario
        println(clave, " => ", valor)
    end

    claves = collect(keys(mi_diccionario))
    println(claves)
end
main()