
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/21/2018 11:45:05
-- Generated from EDMX file: C:\Users\iscfperalta\Desktop\DataTicketRecordChart-master\DataTicketRecordChart-master\DataTicketChart\Models\Domain\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [EnForma];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_TblHistorialPeso_TblSocio]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TblHistorialPeso] DROP CONSTRAINT [FK_TblHistorialPeso_TblSocio];
GO
IF OBJECT_ID(N'[dbo].[FK_relationRecordSocio_Record]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TblRecordSocio] DROP CONSTRAINT [FK_relationRecordSocio_Record];
GO
IF OBJECT_ID(N'[dbo].[FK_relationRecordSocio_TblSocio]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TblRecordSocio] DROP CONSTRAINT [FK_relationRecordSocio_TblSocio];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[TblHistorialPeso]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TblHistorialPeso];
GO
IF OBJECT_ID(N'[dbo].[TblRecord]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TblRecord];
GO
IF OBJECT_ID(N'[dbo].[TblRecordSocio]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TblRecordSocio];
GO
IF OBJECT_ID(N'[dbo].[TblSocio]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TblSocio];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'TblHistorialPeso'
CREATE TABLE [dbo].[TblHistorialPeso] (
    [id_historial] int IDENTITY(1,1) NOT NULL,
    [id_socio] int  NOT NULL,
    [prev_peso] decimal(18,2)  NOT NULL,
    [prev_alto] decimal(18,2)  NOT NULL,
    [prev_bajo] decimal(18,2)  NOT NULL,
    [prev_cadera] decimal(18,2)  NOT NULL
);
GO

-- Creating table 'TblRecord'
CREATE TABLE [dbo].[TblRecord] (
    [id_record] int  NOT NULL,
    [peso] decimal(18,2)  NULL,
    [pesoi] decimal(18,2)  NULL,
    [pesob] decimal(18,2)  NULL,
    [abdai] decimal(18,2)  NULL,
    [abda] decimal(18,2)  NULL,
    [abdab] decimal(18,2)  NULL,
    [abdbi] decimal(18,2)  NULL,
    [abdb] decimal(18,2)  NULL,
    [abdbb] decimal(18,2)  NULL,
    [caderai] decimal(18,2)  NULL,
    [cadera] decimal(18,2)  NULL,
    [caderatb] decimal(18,2)  NULL,
    [altura] decimal(18,2)  NULL,
    [talla] varchar(50)  NULL,
    [grasac] decimal(18,2)  NULL,
    [imc] decimal(18,2)  NULL,
    [ta] decimal(18,2)  NULL,
    [guia] decimal(18,2)  NULL,
    [observaciones] nvarchar(max)  NULL
);
GO

-- Creating table 'TblRecordSocio'
CREATE TABLE [dbo].[TblRecordSocio] (
    [id_relation] int  NOT NULL,
    [id_socio] int  NULL,
    [id_record] int  NULL
);
GO

-- Creating table 'TblSocio'
CREATE TABLE [dbo].[TblSocio] (
    [id_socio] int IDENTITY(1,1) NOT NULL,
    [num_socio] int  NOT NULL,
    [nombre] varchar(50)  NOT NULL,
    [ap_paterno] varchar(50)  NOT NULL,
    [ap_materno] varchar(50)  NOT NULL,
    [direccion] varchar(max)  NOT NULL,
    [fecha_registro] datetime  NOT NULL,
    [fecha_baja] datetime  NOT NULL,
    [activo] bit  NOT NULL,
    [fecha_modificacion] datetime  NOT NULL,
    [telefono] varchar(18)  NULL,
    [fecha_nacimiento] datetime  NOT NULL,
    [compEstudios] bit  NULL,
    [mail] varchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id_historial] in table 'TblHistorialPeso'
ALTER TABLE [dbo].[TblHistorialPeso]
ADD CONSTRAINT [PK_TblHistorialPeso]
    PRIMARY KEY CLUSTERED ([id_historial] ASC);
GO

-- Creating primary key on [id_record] in table 'TblRecord'
ALTER TABLE [dbo].[TblRecord]
ADD CONSTRAINT [PK_TblRecord]
    PRIMARY KEY CLUSTERED ([id_record] ASC);
GO

-- Creating primary key on [id_relation] in table 'TblRecordSocio'
ALTER TABLE [dbo].[TblRecordSocio]
ADD CONSTRAINT [PK_TblRecordSocio]
    PRIMARY KEY CLUSTERED ([id_relation] ASC);
GO

-- Creating primary key on [id_socio] in table 'TblSocio'
ALTER TABLE [dbo].[TblSocio]
ADD CONSTRAINT [PK_TblSocio]
    PRIMARY KEY CLUSTERED ([id_socio] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [id_socio] in table 'TblHistorialPeso'
ALTER TABLE [dbo].[TblHistorialPeso]
ADD CONSTRAINT [FK_TblHistorialPeso_TblSocio]
    FOREIGN KEY ([id_socio])
    REFERENCES [dbo].[TblSocio]
        ([id_socio])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TblHistorialPeso_TblSocio'
CREATE INDEX [IX_FK_TblHistorialPeso_TblSocio]
ON [dbo].[TblHistorialPeso]
    ([id_socio]);
GO

-- Creating foreign key on [id_record] in table 'TblRecordSocio'
ALTER TABLE [dbo].[TblRecordSocio]
ADD CONSTRAINT [FK_relationRecordSocio_Record]
    FOREIGN KEY ([id_record])
    REFERENCES [dbo].[TblRecord]
        ([id_record])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_relationRecordSocio_Record'
CREATE INDEX [IX_FK_relationRecordSocio_Record]
ON [dbo].[TblRecordSocio]
    ([id_record]);
GO

-- Creating foreign key on [id_socio] in table 'TblRecordSocio'
ALTER TABLE [dbo].[TblRecordSocio]
ADD CONSTRAINT [FK_relationRecordSocio_TblSocio]
    FOREIGN KEY ([id_socio])
    REFERENCES [dbo].[TblSocio]
        ([id_socio])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_relationRecordSocio_TblSocio'
CREATE INDEX [IX_FK_relationRecordSocio_TblSocio]
ON [dbo].[TblRecordSocio]
    ([id_socio]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------