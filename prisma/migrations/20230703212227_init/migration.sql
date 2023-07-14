-- CreateTable
CREATE TABLE `producto` (
    `id_producto` INTEGER NOT NULL,
    `categoria_prod` VARCHAR(191) NOT NULL,
    `desc_producto` VARCHAR(191) NOT NULL,
    `precio` DOUBLE NOT NULL,

    PRIMARY KEY (`id_producto`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cliente` (
    `id_cliente` INTEGER NOT NULL,
    `nombre_cliente` VARCHAR(191) NOT NULL,
    `apellido_cliente` VARCHAR(191) NOT NULL,
    `tel_cliente` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_cliente`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tienda` (
    `nombre_tienda` VARCHAR(191) NOT NULL,
    `id_tienda` INTEGER NOT NULL,
    `sucursal` VARCHAR(191) NOT NULL,
    `tel_tienda` INTEGER NOT NULL,

    PRIMARY KEY (`id_tienda`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `vendedor` (
    `id_vendedor` INTEGER NOT NULL,
    `nombre_vendedor` VARCHAR(191) NOT NULL,
    `apellido_vendedor` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_vendedor`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `stock` (
    `registro` INTEGER NOT NULL,
    `cantidad` INTEGER NOT NULL,
    `id_producto1` INTEGER NOT NULL,
    `id_tienda1` INTEGER NOT NULL,

    PRIMARY KEY (`registro`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `venta` (
    `numero_venta` INTEGER NOT NULL AUTO_INCREMENT,
    `cant_venta` INTEGER NOT NULL,
    `fecha` DATETIME(3) NOT NULL,
    `id_producto2` INTEGER NOT NULL,
    `id_tienda2` INTEGER NOT NULL,
    `id_vendedor1` INTEGER NOT NULL,
    `id_cliente1` INTEGER NOT NULL,

    PRIMARY KEY (`numero_venta`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `stock` ADD CONSTRAINT `stock_id_producto1_fkey` FOREIGN KEY (`id_producto1`) REFERENCES `producto`(`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `stock` ADD CONSTRAINT `stock_id_tienda1_fkey` FOREIGN KEY (`id_tienda1`) REFERENCES `tienda`(`id_tienda`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `venta` ADD CONSTRAINT `venta_id_producto2_fkey` FOREIGN KEY (`id_producto2`) REFERENCES `producto`(`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `venta` ADD CONSTRAINT `venta_id_tienda2_fkey` FOREIGN KEY (`id_tienda2`) REFERENCES `tienda`(`id_tienda`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `venta` ADD CONSTRAINT `venta_id_vendedor1_fkey` FOREIGN KEY (`id_vendedor1`) REFERENCES `vendedor`(`id_vendedor`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `venta` ADD CONSTRAINT `venta_id_cliente1_fkey` FOREIGN KEY (`id_cliente1`) REFERENCES `cliente`(`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE;
