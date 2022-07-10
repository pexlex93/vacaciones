-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 10-07-2022 a las 18:51:12
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pw_ii`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `genero` varchar(15) NOT NULL,
  `descripcion` text NOT NULL,
  `url` text NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `genero`, `descripcion`, `url`, `fecha`, `categoria`) VALUES
(1, 'Wonder Woman', 'mujer', 'Diana, hija de dioses y princesa de las amazonas, nunca ha salido de su isla. Un día, en el contexto de la Primera Guerra Mundial, un piloto americano se estrella en su isla y Diana salva su vida; el piloto le explica que se está desarrollando una gran guerra que puede devastar el mundo, y Diana parte a la batalla.', 'https://cloudfront-us-east-1.images.arcpublishing.com/infobae/VEKBDRVQZFHZHNEUDXC5EAF2QU.jpg', '2022-07-09 14:21:21', 'DC Comics'),
(2, 'superman', 'hombre', 'Clark Kent, también conocido por su nombre de nacimiento Kal-El o por su nombre de superhéroe Superman, es un personaje ficticio y superhéroe de las películas del Universo extendido de DC, basado en el personaje del mismo nombre creado por Jerry Siegel y Joe Shuster.', 'https://i1.wp.com/www.tomosygrapas.com/wp-content/uploads/2021/02/Portada-co%CC%81mic-Superman-78-de-Reeves-copia.jpg?resize=1024%2C520&ssl=1', '2022-07-06 08:32:13', 'DC Comics'),
(13, 'spider-man\r\n\r\n\r\n\r\n', 'hombre', 'Spider-Man, traducido en ocasiones como El Hombre Araña, ​​ es un personaje creado por los estadounidenses Stan Lee y Steve Ditko, ​​ e introducido en el cómic Amazing Fantasy n.° 15, publicado por Marvel Comics en agosto de 1962', 'https://i.pinimg.com/originals/d5/6b/c4/d56bc445842242b29284d60b4b9a2684.jpg', '2022-03-08 08:32:16', 'Marvel Comics'),
(14, 'aquaman', 'hombre', 'Arthur Curry, también conocido como Aquaman (Jason Momoa), es un habitante de un poderoso reino subacuático que recibe el nombre de la Atlántida.', 'https://dam.smashmexico.com.mx/wp-content/uploads/2018/02/10161341/el-origen-del-traje-y-nombre-de-aquaman-2.jpg', '2021-10-12 16:07:20', 'DC Comics'),
(15, 'Donatello', 'hombre', 'Donatello, Don o Donnie, es un personaje ficticio y uno de los cuatro personajes principales de los cómics Tortugas Ninja y todos los medios relacionados. Es la tortuga favorita del cocreador Peter Laird. Por lo general, se le representa con una bandana de ojos púrpura.', 'https://www.eluniverso.com/resizer/QFsmo-nkxmfpRxqcjbDXtckpE5c=/1191x670/smart/filters:quality(70)/cloudfront-us-east-1.images.arcpublishing.com/eluniverso/AI54ZUEXNNGPROY5TT46625U3A.jpg', '2021-11-11 13:39:45', 'TMNT'),
(16, 'jean grey', 'mujer', 'Jean Elaine Grey Summers es una superheroína ficticia que aparece en los cómics estadounidenses publicados por Marvel Comics. Jean es catalogada como la mutante más poderosa del universo Marvel. El personaje ha sido conocido con los alias Marvel Girl, Phoenix, Dark Phoenix y Estrella de Fuego.', 'https://gcdn.lanetaneta.com/wp-content/uploads/2021/12/Por-que-Jean-Grey-de-los-X-Men-usa-su-nombre-780x470.jpg', '2022-02-16 08:32:16', 'Marvel Comics'),
(17, 'Batgirl', 'mujer', 'Batgirl o Batichica es el nombre de varias superheroínas ficticias que aparecen en los cómics estadounidenses publicados por DC Comics, representados como contrapartes femeninas del superhéroe Batman', 'https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2021/07/Batgirl-scaled.jpeg?fit=1200%2C675&quality=50&strip=all&ssl=1', '2022-07-10 10:53:01', 'DC Comics'),
(18, 'Black Widow', 'mujer', 'Natasha nació en Stalingrado (ahora Volgogrado), Rusia. La primera y más conocida Viuda Negra, es una agente rusa entrenada como espía, artista marcial y francotiradora, y equipada con un arsenal de armas de alta tecnología, que incluye un par de armas energéticas montadas en la muñeca y apodada \"Piquete de la Viuda\". No usa traje durante sus primeras apariciones, sino simplemente ropa de noche y un velo. Romanova eventualmente deserta a Estados Unidos por razones que incluyen su amor por el arquero criminal convertido en superhéroe, Hawkeye.', 'https://live.staticflickr.com/7126/7122168441_177a3c0fc9_b.jpg', '2022-07-10 10:57:26', 'Marvel Comics');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_usuario` (`id_usuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `fk_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
