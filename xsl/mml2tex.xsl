<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
  xmlns:xs="http://www.w3.org/2001/XMLSchema"  
  xmlns:tr="http://transpect.io"
  xmlns:mml="http://www.w3.org/1998/Math/MathML" 
  xmlns:mml2tex="http://transpect.io/mml2tex"
  xmlns:xml2tex="http://transpect.io/xml2tex"
  xmlns:functx="http://www.functx.com"
  exclude-result-prefixes="tr mml xs" 
  xpath-default-namespace="http://www.w3.org/1998/Math/MathML" 
  version="2.0">

  <xsl:import href="function-names.xsl"/>
  <xsl:import href="operators.xsl"/>

  <xsl:output method="text" encoding="UTF-8"/>
  
  <xsl:param name="fail-on-error" select="'yes'"/><!-- yes|no -->

  <xsl:param name="set-math-style" select="'no'"/><!-- yes|no -->

  <xsl:param name="always-use-left-right" select="'auto'"/><!-- yes|no|auto -->

<xsl:param name="texmap-uri" select="'https://raw.githubusercontent.com/samgabriel/mml2tex/master/texmap/texmap.xml'" as="xs:string"/>
  
 <xsl:param name="texmap-upgreek-uri" select="'https://raw.githubusercontent.com/samgabriel/mml2tex/master/texmap/texmap-upgreek.xml'" as="xs:string"/>
    
  <xml2tex:set xmlns="http://transpect.io/xml2tex">
  <charmap>
  
    <!-- *
         * Unicode characters and corresponding LaTeX math mode commands
         * -->
    
    <char character="ß" string="\ss"/>
    
    <!-- *
         * Basic Latin
         * -->
    
    <!--EXCLAMATION MARK-->
    <char character="&#x21;" string="!"/>
    <!--NUMBER SIGN-->
    <char character="&#x23;" string="\#"/>
    <!--= \mathdollar, DOLLAR SIGN-->
    <char character="&#x24;" string="\$"/>
    <!--PERCENT SIGN-->
    <char character="&#x25;" string="\%"/>
    <!--# \binampersand (stmaryrd)-->
    <char character="&#x26;" string="\&amp;"/>
    <!--x :, COLON (not ratio)-->
    <char character="&#x3a;" string="\colon"/>    
    <!--REVERSE SOLIDUS-->
    <char character="&#x5c;" string="\backslash"/>
    <!--CIRCUMFLEX ACCENT, TeX superscript operator-->
    <char character="&#x5e;" string="\sphat"/>
    <!--LOW LINE, TeX subscript operator-->
    <char character="&#x5f;" string="\_"/>
    <!-- LEFT CURLY BRACKET -->
    <char character="&#x7b;" string="\{"/>
    <!-- RIGHT CURLY BRACKET -->
    <char character="&#x7d;" string="\}"/>
    <!--# \sim, TILDE-->
    <char character="&#x7e;" string="\sim"/>
  
    <!-- *
         * Latin-1 Supplement
         * -->
    
    <!--nbsp-->
    <char character="&#xa0;" string="~"/>
    <!--= \mathcent (txfonts), cent-->
    <char character="&#xa2;" string="\cent"/>
    <!--= \mathsterling (txfonts), POUND SIGN, fourier prints a dollar sign-->
    <char character="&#xa3;" string="\pounds"/>
    <!--YEN SIGN-->
    <char character="&#xa5;" string="\yen"/>
    <!--= \lnot, NOT SIGN-->
    <char character="&#xac;" string="\neg"/>
    <!--REGISTERED SIGN-->
    <char character="&#xae;" string="\circledR"/>
    <!-- MACRON -->
    <char character="&#xaf;" string="\bar"/>
    <!-- DEGREE SIGN -->
    <char character="&#xb0;" string="^{\circ}"/>
    <!--plus-or-minus sign-->
    <char character="&#xb1;" string="\pm"/>    
    <!--SUPERSCRIPT TWO -->
    <char character="&#xb2;" string="^{2}"/>
    <!--SUPERSCRIPT THREE -->
    <char character="&#xb3;" string="^{3}"/>
    <!--= \tcmu (mathcomp), t \textmu (textcomp), # \mathrm{\mu} (omlmathrm), # \muup (kpfonts mathdesign), MICRO SIGN-->
    <char character="&#xb5;" string="\mathrm{\mu}"/>
    <!-- middle dot -->
    <char character="&#xb7;" string="\cdot"/>
    <!-- SUPERSCRIPT ONE -->
    <char character="&#xb9;" string="^{1}"/>
    <!--MULTIPLICATION SIGN, z notation Cartesian product-->
    <char character="&#xd7;" string="\times"/>
    <!--LATIN CAPITAL LETTER A WITH DIAERESIS-->
    <char character="&#xc4;" string="\&quot;A"/>
    <!--LATIN CAPITAL LETTER O WITH DIAERESIS-->
    <char character="&#xd6;" string="\&quot;O"/>
    <!--LATIN CAPITAL LETTER U WITH DIAERESIS-->
    <char character="&#xdc;" string="\&quot;U"/>
    <!--LATIN SMALL LETTER A WITH DIAERESIS-->
    <char character="&#xe4;" string="\&quot;a"/>
    <!--eth-->
    <char character="&#xf0;" string="\eth"/>
    <!--LATIN SMALL LETTER O WITH DIAERESIS-->
    <char character="&#xf6;" string="\&quot;o"/>
    <!--divide sign-->
    <char character="&#xf7;" string="\div"/>
    <!--LATIN SMALL LETTER U WITH DIAERESIS-->
    <char character="&#xfc;" string="\&quot;u"/>

    <!-- *
         * Latin Extended-B
         * -->
    
    <!-- LATIN SMALL LETTER F WITH HOOK -->
    <char character="&#x192;" string="\mathit{f}"/>
    <!--jmath-->
    <char character="&#x237;" string="\jmath"/>
  
    <!-- *
         * Latin Extended-A
         * -->
  
    <!--imath-->
    <char character="&#x131;" string="\imath"/>
  
    <!-- *
         * Latin Extended-B
         * -->
  
    <!--jmath-->
    <char character="&#x237;" string="\jmath"/>
  
    <!-- *
         * Spacing Modifier Letters
         * -->    
  
    <!-- *
         * Combining Diacritical Marks
         * -->
  
    <!--grave accent-->
    <char character="&#x300;" string="\grave"/>
    <!--acute accent-->
    <char character="&#x301;" string="\acute"/>
    <!--# \widehat (amssymb), circumflex accent-->
    <char character="&#x302;" string="\hat"/>
    <!--# \widetilde (yhmath, fourier), tilde-->
    <char character="&#x303;" string="\tilde"/>
    <!--macron-->
    <char character="&#x304;" string="\bar"/>
    <!--overbar embellishment-->
    <char character="&#x305;" string="\overline"/>
    <!--breve-->
    <char character="&#x306;" string="\breve"/>
    <!--= \Dot (wrisym), dot above-->
    <char character="&#x307;" string="\dot"/>
    <!--= \DDot (wrisym), dieresis-->
    <char character="&#x308;" string="\ddot"/>
    <!--= \ring (yhmath), ring-->
    <char character="&#x30a;" string="\mathring"/>
    <!--caron-->
    <char character="&#x30c;" string="\check"/>
    <!--under tilde accent (multiple characters and non-spacing)-->
    <char character="&#x330;" string="\utilde"/>
    <!--COMBINING MACRON BELOW-->
    <char character="&#x331;" string="\underbar"/>
    <!--COMBINING LOW LINE-->
    <char character="&#x332;" string="\underline"/>
    <!--COMBINING LONG SOLIDUS OVERLAY-->
    <char character="&#x338;" string="\not"/>
  
    <!-- *
         * Greek and Coptic
         * -->
  
    <!-- GREEK CAPITAL LETTER ALPHA -->
    <char character="&#x391;" string="A"/>
    <!-- GREEK CAPITAL LETTER BETA -->
    <char character="&#x392;" string="B"/>
    <!--= \Gamma (-slantedGreek), = \mathrm{\Gamma}, capital gamma, greek-->   
    <char character="&#x393;" string="\Gamma"/>
    <!--= \Delta (-slantedGreek), = \mathrm{\Delta}, capital delta, greek-->
    <char character="&#x394;" string="\Delta"/>
    <!-- GREEK CAPITAL LETTER EPSILON -->
    <char character="&#x395;" string="E"/>
    <!-- GREEK CAPITAL LETTER ZETA -->
    <char character="&#x396;" string="Z"/>
    <!-- GREEK CAPITAL LETTER ETA -->
    <char character="&#x397;" string="H"/>
    <!--= \Theta (-slantedGreek), = \mathrm{\Theta}, capital theta, greek-->
    <char character="&#x398;" string="\Theta"/>
    <!-- GREEK CAPITAL LETTER IOTA -->
    <char character="&#x399;" string="I"/>
    <!-- GREEK CAPITAL LETTER KAPPA -->
    <char character="&#x39a;" string="K"/>
    <!--= \Lambda (-slantedGreek), = \mathrm{\Lambda}, capital lambda, greek-->
    <char character="&#x39b;" string="\Lambda"/>
    <!-- GREEK CAPITAL LETTER MU -->
    <char character="&#x39c;" string="M"/>
    <!-- GREEK CAPITAL LETTER NU -->
    <char character="&#x39d;" string="N"/>
    <!-- GREEK CAPITAL LETTER OMICRON -->
    <char character="&#x39f;" string="O"/>
    <!--= \Xi (-slantedGreek), = \mathrm{\Xi}, capital xi, greek-->
    <char character="&#x39e;" string="\Xi"/>
    <!--= \Pi (-slantedGreek), = \mathrm{\Pi}, capital pi, greek-->
    <char character="&#x3a0;" string="\Pi"/>
    <!-- GREEK CAPITAL LETTER RHO -->
    <char character="&#x3a1;" string="P"/>
    <!--= \Sigma (-slantedGreek), = \mathrm{\Sigma}, capital sigma, greek-->
    <char character="&#x3a3;" string="\Sigma"/>
    <!-- GREEK CAPITAL LETTER TAU -->
    <char character="&#x3a4;" string="T"/>
    <!--= \Upsilon (-slantedGreek), = \mathrm{\Upsilon}, capital upsilon, greek-->
    <char character="&#x3a5;" string="\Upsilon"/>
    <!--= \Phi (-slantedGreek), = \mathrm{\Phi}, capital phi, greek-->
    <char character="&#x3a6;" string="\Phi"/>
    <!-- GREEK CAPITAL LETTER CHI -->
    <char character="&#x3a7;" string="X"/>
    <!--= \Psi (-slantedGreek), = \mathrm{\Psi}, capital psi, greek-->
    <char character="&#x3a8;" string="\Psi"/>
    <!--= \Omega (-slantedGreek), = \mathrm{\Omega}, capital omega, greek-->
    <char character="&#x3a9;" string="\Omega"/>
    <!--= \mathrm{\alpha} (omlmathrm), = \alphaup (kpfonts mathdesign), = \upalpha (upgreek),  alpha, greek-->
    <char character="&#x3b1;" string="\alpha"/>
    <!--= \mathrm{\beta} (omlmathrm), = \betaup (kpfonts mathdesign), = \upbeta (upgreek),  beta, greek-->
    <char character="&#x3b2;" string="\beta"/>
    <!--= \mathrm{\gamma} (omlmathrm), = \gammaup (kpfonts mathdesign), = \upgamma (upgreek),  gamma, greek-->
    <char character="&#x3b3;" string="\gamma"/>
    <!--= \mathrm{\delta} (omlmathrm), = \deltaup (kpfonts mathdesign), = \updelta (upgreek),  delta, greek-->
    <char character="&#x3b4;" string="\delta"/>
    <!--= \mathrm{\varepsilon} (omlmathrm), = \varepsilonup (kpfonts mathdesign), rounded = \upepsilon (upgreek),  epsilon, greek-->
    <char character="&#x3b5;" string="\varepsilon"/>
    <!--= \mathrm{\zeta} (omlmathrm), = \zetaup (kpfonts mathdesign), = \upzeta (upgreek),  zeta, greek-->
    <char character="&#x3b6;" string="\zeta"/>
    <!--= \mathrm{\eta} (omlmathrm), = \etaup (kpfonts mathdesign), = \upeta (upgreek),  eta, greek-->
    <char character="&#x3b7;" string="\eta"/>
    <!--= \mathrm{\theta} (omlmathrm), = \thetaup (kpfonts mathdesign), straight theta, = \uptheta (upgreek),  theta, greek-->
    <char character="&#x3b8;" string="\theta"/>
    <!--= \mathrm{\iota} (omlmathrm), = \iotaup (kpfonts mathdesign), = \upiota (upgreek),  iota, greek-->
    <char character="&#x3b9;" string="\iota"/>
    <!--= \mathrm{\kappa} (omlmathrm), = \kappaup (kpfonts mathdesign), = \upkappa (upgreek),  kappa, greek-->
    <char character="&#x3ba;" string="\kappa"/>
    <!--= \mathrm{\lambda} (omlmathrm), = \lambdaup (kpfonts mathdesign), = \uplambda (upgreek),  lambda, greek-->
    <char character="&#x3bb;" string="\lambda"/>
    <!--= \mathrm{\mu} (omlmathrm), = \muup (kpfonts mathdesign), = \upmu (upgreek),  mu, greek-->
    <char character="&#x3bc;" string="\mu"/>
    <!--= \mathrm{\nu} (omlmathrm), = \nuup (kpfonts mathdesign), = \upnu (upgreek),  nu, greek-->
    <char character="&#x3bd;" string="\nu"/>
    <!--= \mathrm{\xi} (omlmathrm), = \xiup (kpfonts mathdesign), = \upxi (upgreek),  xi, greek-->
    <char character="&#x3be;" string="\xi"/>
    <!-- omicron, greek -->
    <char character="&#x3bf;" string="o"/>
    <!--= \mathrm{\pi} (omlmathrm), = \piup (kpfonts mathdesign), = \uppi (upgreek),  pi, greek-->
    <char character="&#x3c0;" string="\pi"/>
    <!--= \mathrm{\rho} (omlmathrm), = \rhoup (kpfonts mathdesign), = \uprho (upgreek),  rho, greek-->
    <char character="&#x3c1;" string="\rho"/>
    <!--= \mathrm{\varsigma} (omlmathrm), = \varsigmaup (kpfonts mathdesign), terminal sigma, greek-->
    <char character="&#x3c2;" string="\varsigma"/>
    <!--= \mathrm{\sigma} (omlmathrm), = \sigmaup (kpfonts mathdesign), = \upsigma (upgreek),  sigma, greek-->
    <char character="&#x3c3;" string="\sigma"/>
    <!--= \mathrm{\tau} (omlmathrm), = \tauup (kpfonts mathdesign), = \uptau (upgreek),  tau, greek-->
    <char character="&#x3c4;" string="\tau"/>
    <!--= \mathrm{\upsilon} (omlmathrm), = \upsilonup (kpfonts mathdesign), = \upupsilon (upgreek),  upsilon, greek-->
    <char character="&#x3c5;" string="\upsilon"/>
    <!--= \mathrm{\varphi} (omlmathrm), = \varphiup (kpfonts mathdesign), curly or open = \upvarphi (upgreek),  phi, greek-->
    <char character="&#x3c6;" string="\varphi"/>
    <!--= \mathrm{\chi} (omlmathrm), = \chiup (kpfonts mathdesign), = \upchi (upgreek),  chi, greek-->
    <char character="&#x3c7;" string="\chi"/>
    <!--= \mathrm{\psi} (omlmathrm), = \psiup (kpfonts mathdesign), = \uppsi (upgreek),  psi, greek-->
    <char character="&#x3c8;" string="\psi"/>
    <!--= \mathrm{\omega} (omlmathrm), = \omegaup (kpfonts mathdesign), = \upomega (upgreek),  omega, greek-->
    <char character="&#x3c9;" string="\omega"/>
    <!--rounded = \upvarbeta (upgreek),  beta, greek-->
    <char character="&#x3d0;" string="\upvarbeta"/>
    <!--= \mathrm{\vartheta} (omlmathrm), = \varthetaup (kpfonts mathdesign), curly or open theta-->
    <char character="&#x3d1;" string="\vartheta"/>
    <!--= \mathrm{\phi} (omlmathrm), = \phiup (kpfonts mathdesign), GREEK PHI SYMBOL (straight)-->
    <char character="&#x3d5;" string="\phi"/>
    <!--= \mathrm{\varpi} (omlmathrm), = \varpiup (kpfonts mathdesign), GREEK PI SYMBOL (pomega)-->
    <char character="&#x3d6;" string="\varpi"/>
    <!--= \Koppa (wrisym), t \Qoppa (LGR), GREEK LETTER ARCHAIC KOPPA-->
    <char character="&#x3d8;" string="\Qoppa"/>
    <!--= \koppa (wrisym), t \qoppa (LGR), GREEK SMALL LETTER ARCHAIC KOPPA-->
    <char character="&#x3d9;" string="\qoppa"/>
    <!--capital stigma-->
    <char character="&#x3da;" string="\Stigma"/>
    <!--GREEK SMALL LETTER STIGMA-->
    <char character="&#x3db;" string="\stigma"/>
    <!--= \Digamma (wrisym), capital digamma-->
    <char character="&#x3dc;" string="\Digamma"/>
    <!--GREEK SMALL LETTER DIGAMMA-->
    <char character="&#x3dd;" string="\digamma"/>
    <!--capital koppa-->
    <char character="&#x3de;" string="\Koppa"/>
    <!--GREEK SMALL LETTER KOPPA-->
    <char character="&#x3df;" string="\koppa"/>
    <!--capital sampi-->
    <char character="&#x3e0;" string="\Sampi"/>
    <!--# \sampi (wrisym), GREEK SMALL LETTER SAMPI-->
    <char character="&#x3e1;" string="\sampi"/>
    <!--= \mathrm{\varrho} (omlmathrm), = \varrhoup (kpfonts mathdesign), GREEK RHO SYMBOL (round)-->
    <char character="&#x3f1;" string="\varrho"/>
    <!--= \mathrm{\epsilon} (omlmathrm), = \epsilonup (kpfonts mathdesign), GREEK LUNATE EPSILON SYMBOL-->
    <char character="&#x3f5;" string="\epsilon"/>
    <!--GREEK REVERSED LUNATE EPSILON SYMBOL-->
    <char character="&#x3f6;" string="\backepsilon"/>
  
    <!--  *
          * Cyrillic
          * -->
  
    <!-- *
         * General Punctuation
         * -->
  
    <!--EM QUAD -->   
    <char character="&#x2001;" string="\quad"/>
    <!-- EN SPACE -->
    <char character="&#x2002;" string="\enspace"/>
    <!--EM SPACE -->
    <char character="&#x2003;" string="\quad"/>
    <!--THREE-PER-EM SPACE -->
    <char character="&#x2004;" string="\,"/>
    <!--FOUR-PER-EM SPACE -->
    <char character="&#x2005;" string="\,"/>
    <!--SIX-PER-EM SPACE -->
    <char character="&#x2006;" string="\,"/>
    <!--FIGURE SPACE	 -->
    <char character="&#x2007;" string="\,"/>
    <!--PUNCTUATION SPACE -->
    <char character="&#x2008;" string="\,"/>
    <!--THIN SPACE -->
    <char character="&#x2009;" string="\,"/>
    <!--HAIR SPACE -->
    <char character="&#x200a;" string="\,"/>
    <!--ZERO WIDTH SPACE -->
    <char character="&#x200b;" string="\hspace{0pt}"/>
    <!--NON-BREAKING HYPHEN -->
    <char character="&#x2011;" string="\hbox{-}"/>
    <!--MINUS SIGN -->
    <char character="&#x2012;" string="-"/>
    <!--EN DASH -->
    <char character="&#x2013;" string="\hbox{--}"/>
    <!--EM DASH -->
    <char character="&#x2014;" string="\hbox{---}"/>
    <!--HORIZONTAL BAR -->
    <char character="&#x2015;" string="\hbox{---}"/>
    <!--= \Vert, double vertical bar-->
    <char character="&#x2016;" string="\|"/>
    <!-- LEFT SINGLE QUOTATION MARK -->
    <char character="&#x2018;" string="'"/>
    <!-- RIGHT SINGLE QUOTATION MARK -->
    <char character="&#x2019;" string="`"/>
    <!-- SINGLE LOW-9 QUOTATION MARK -->
    <char character="&#x201a;" string=","/>
    <!-- SINGLE HIGH-REVERSED-9 QUOTATION MARK -->
    <char character="&#x201b;" string="`"/>
    <!-- LEFT DOUBLE QUOTATION MARK -->
    <char character="&#x201c;" string="``"/>
    <!-- RIGHT DOUBLE QUOTATION MARK -->
    <char character="&#x201d;" string="''"/>
    <!-- DOUBLE LOW-9 QUOTATION MARK -->
    <char character="&#x201e;" string=",,"/>
    <!--DAGGER relation-->
    <char character="&#x2020;" string="\dagger"/>
    <!--DOUBLE DAGGER relation-->
    <char character="&#x2021;" string="\ddagger"/>
    <!--BULLET cdot -->
    <char character="&#x2022;" string="\cdot"/>
    <!--TRIANGULAR BULLET-->
    <char character="&#x2023;" string="\blacktriangleright"/>
    <!--ONE DOT LEADER-->
    <char character="&#x2024;" string="\ldotp"/>
    <!--TWO DOT LEADER-->
    <char character="&#x2025;" string="\ldotp\ldotp"/>
    <!--ellipsis (horizontal)-->
    <char character="&#x2026;" string="\ldots"/>
    <!-- HYPHENATION POINT -->
    <char character="&#x2027;" string="\cdot"/>
    <!-- PER MILLE SIGN -->
    <char character="&#x2030;" string="\permil"/>
    <!--PRIME or minute, not superscripted-->
    <char character="&#x2032;" string="'"/>
    <!--DOUBLE PRIME or second, not superscripted-->
    <char character="&#x2033;" string="''"/>
    <!--TRIPLE PRIME (not superscripted)-->
    <char character="&#x2034;" string="'''"/>
    <!--reverse prime, not superscripted-->
    <char character="&#x2035;" string="\backprime"/>
    <!-- DOUBLE REVERSE PRIME, not superscripted -->
    <char character="&#x2036;" string="\backdprime"/>
    <!-- TRIPLE REVERSE PRIME, not superscripted -->
    <char character="&#x2037;" string="\backtrprime"/>
    <!-- CARET (insertion mark) -->
    <char character="&#x2038;" string="\caretinsert"/>
    <!-- DOUBLE EXCLAMATION MARK -->
    <char character="&#x203c;" string="\Exclam"/>
    <!--CHARACTER TIE, z notation sequence concatenation-->
    <char character="&#x2040;" string="\cat"/>
    <!-- HYPHEN BULLET -->
    <char character="&#x2043;" string="\hyphenbullet"/>
    <!-- DOUBLE QUESTION MARK -->
    <char character="&#x2047;" string="\Question"/>
    <!--QUADRUPLE PRIME, not superscripted-->
    <char character="&#x2057;" string="\qprime"/>
    <!-- FUNCTION APPLICATION -->
    <char character="&#x2061;" string=""/>
    <!-- INVISIBLE TIMES -->
    <char character="&#x2062;" string=""/>
    <!-- INVISIBLE SEPARATOR -->
    <char character="&#x2063;" string=""/>
    <!-- INVISIBLE PLUS -->
    <char character="&#x2064;" string=""/>
    <!--= \medspace (amsmath), MEDIUM MATHEMATICAL SPACE-->
    <char character="&#x205f;" string="\:"/>
    
    <!--  *
          * Superscripts and Subscripts
          * -->
    
    <!-- SUPERSCRIPT FOUR -->
    <char character="&#x2074;" string="$^{4}$"/>
    <!-- SUPERSCRIPT FIVE -->
    <char character="&#x2075;" string="$^{5}$"/>
    <!-- SUPERSCRIPT SIX -->
    <char character="&#x2076;" string="$^{6}$"/>
    <!-- SUPERSCRIPT SEVEN -->
    <char character="&#x2077;" string="$^{7}$"/>
    <!-- SUPERSCRIPT EIGHT -->
    <char character="&#x2078;" string="$^{8}$"/>
    <!-- SUPERSCRIPT NINE -->
    <char character="&#x2079;" string="$^{9}$"/>
    <!-- SUPERSCRIPT PLUS SIGN -->
    <char character="&#x207a;" string="$^{+}$"/>
    <!-- SUPERSCRIPT MINUS SIGN -->
    <char character="&#x207b;" string="$^{-}$"/>
    <!-- SUPERSCRIPT EQUALS SIGN -->
    <char character="&#x207c;" string="$^{=}$"/>
    <!-- SUPERSCRIPT LEFT PARENTHESIS -->
    <char character="&#x207d;" string="$^{(}$"/>
    <!-- SUPERSCRIPT RIGHT PARENTHESIS  -->
    <char character="&#x207e;" string="$^{)}$"/>
    <!-- SUPERSCRIPT LATIN SMALL LETTER N -->
    <char character="&#x207f;" string="$^{n}$"/>
    <!-- SUBSCRIPT ZERO -->
    <char character="&#x2080;" string="$_{0}$"/>
    <!-- SUBSCRIPT ONE -->
    <char character="&#x2081;" string="$_{1}$"/>
    <!-- SUBSCRIPT TWO -->
    <char character="&#x2082;" string="$_{2}$"/>
    <!-- SUBSCRIPT THREE -->
    <char character="&#x2083;" string="$_{3}$"/>
    <!-- SUBSCRIPT FOUR -->
    <char character="&#x2084;" string="$_{4}$"/>
    <!-- SUBSCRIPT FIVE -->
    <char character="&#x2085;" string="$_{5}$"/>
    <!-- SUBSCRIPT SIX -->
    <char character="&#x2086;" string="$_{6}$"/>
    <!-- SUBSCRIPT SEVEN -->
    <char character="&#x2087;" string="$_{7}$"/>
    <!-- SUBSCRIPT EIGHT -->
    <char character="&#x2088;" string="$_{8}$"/>
    <!-- SUBSCRIPT NINE -->
    <char character="&#x2089;" string="$_{9}$"/>
    <!-- SUBSCRIPT PLUS SIGN -->
    <char character="&#x208a;" string="$_{+}$"/>
    <!-- SUBSCRIPT MINUS SIGN -->
    <char character="&#x208b;" string="$_{-}$"/>
    <!-- SUBSCRIPT EQUALS SIGN -->
    <char character="&#x208c;" string="$_{=}$"/>
    <!-- SUBSCRIPT LEFT PARENTHESIS -->
    <char character="&#x208d;" string="$_{(}$"/>
    <!-- SUBSCRIPT RIGHT PARENTHESIS  -->
    <char character="&#x208e;" string="$_{)}$"/>
    <!-- LATIN SUBSCRIPT SMALL LETTER A -->
    <char character="&#x2090;" string="$_{a}$"/>
    <!-- LATIN SUBSCRIPT SMALL LETTER E -->
    <char character="&#x2091;" string="$_{e}$"/>
    <!-- LATIN SUBSCRIPT SMALL LETTER O -->
    <char character="&#x2092;" string="$_{o}$"/>
    <!-- LATIN SUBSCRIPT SMALL LETTER X -->
    <char character="&#x2093;" string="$_{x}$"/>
    <!-- LATIN SUBSCRIPT SMALL LETTER SCHWA -->
    <char character="&#x2094;" string="$_{\text{\textschwa}}$"/>
    <!-- LATIN SUBSCRIPT SMALL LETTER H -->
    <char character="&#x2095;" string="$_{h}$"/>
    <!-- LATIN SUBSCRIPT SMALL LETTER K -->
    <char character="&#x2096;" string="$_{k}$"/>
    <!-- LATIN SUBSCRIPT SMALL LETTER L -->
    <char character="&#x2097;" string="$_{l}$"/>
    <!-- LATIN SUBSCRIPT SMALL LETTER M -->
    <char character="&#x2098;" string="$_{m}$"/>
    <!-- LATIN SUBSCRIPT SMALL LETTER N -->
    <char character="&#x2099;" string="$_{n}$"/>
    <!-- LATIN SUBSCRIPT SMALL LETTER p -->
    <char character="&#x209a;" string="$_{p}$"/>
    <!-- LATIN SUBSCRIPT SMALL LETTER S -->
    <char character="&#x209b;" string="$_{s}$"/>
    <!-- LATIN SUBSCRIPT SMALL LETTER T -->
    <char character="&#x209c;" string="$_{t}$"/>
  
    <!-- *
         * Currency Symbols
         * -->
    
    <char character="&#x20ac;" string="\euro{}"/>
  
    <!-- *
         * Combining Diacritical Marks for Symbols
         * -->
  
    <!--COMBINING LEFT HARPOON ABOVE-->
    <char character="&#x20d0;" string="\lvec"/>
    <!--COMBINING RIGHT HARPOON ABOVE-->
    <char character="&#x20d1;" string="\vec"/>
    <!--# \overleftarrow, COMBINING LEFT ARROW ABOVE-->
    <char character="&#x20d6;" string="\LVec"/>
    <!--= \Vec (wrisym), # \overrightarrow, COMBINING RIGHT ARROW ABOVE-->
    <char character="&#x20d7;" string="\vec"/>
    <!--= \DDDot (wrisym), COMBINING THREE DOTS ABOVE-->
    <char character="&#x20db;" string="\dddot"/>
    <!--COMBINING FOUR DOTS ABOVE-->
    <char character="&#x20dc;" string="\ddddot"/>
    <!--COMBINING ENCLOSING CIRCLE -->
    <char character="&#x20dd;" string="\enclosecircle"/>
    <!--COMBINING ENCLOSING SQUARE -->
    <char character="&#x20dd;" string="\enclosesquare"/>
    <!--COMBINING ENCLOSING DIAMOND -->
    <char character="&#x20de;" string="\enclosediamond"/>
    <!--COMBINING LEFT RIGHT ARROW ABOVE-->
    <char character="&#x20e1;" string="\overleftrightarrow"/>
    <!--COMBINING ENCLOSING UPWARD POINTING TRIANGLE -->
    <char character="&#x20e4;" string="\enclosetriangle"/>
    <!--COMBINING LEFT ARROW BELOW-->
    <char character="&#x20ee;" string="\underleftarrow"/>
    <!--COMBINING RIGHT ARROW BELOW-->
    <char character="&#x20ef;" string="\underrightarrow"/>
  
    <!-- *
          * Letterlike Symbols
          * -->
  
    <!--= \mathds{C} (dsfont), open face C-->
    <char character="&#x2102;" string="\mathbb{C}"/>
    <!--EULER CONSTANT-->
    <char character="&#x2107;" string="\Euler"/>
    <!--/scr g, script small letter g-->
    <char character="&#x210a;" string="\mathcal{g}"/>
    <!--hamiltonian (script capital H)-->
    <char character="&#x210b;" string="\mathcal{H}"/>
    <!--/frak H, black-letter capital H-->
    <char character="&#x210c;" string="\mathfrak{H}"/>
    <!--= \mathds{H} (dsfont), open face capital H-->
    <char character="&#x210d;" string="\mathbb{H}"/>
    <!--PLANCK CONSTANT-->
    <char character="&#x210e;" string="\mathit{h}"/>
    <!--=\HBar (wrisym), Planck's h over 2pi-->
    <char character="&#x210f;" string="\hslash"/>
    <!--/scr I, script capital I-->
    <char character="&#x2110;" string="\mathcal{I}"/>
    <!--= \mathfrak{I} (eufrak), imaginary part-->
    <char character="&#x2111;" string="\Im"/>
    <!--lagrangian (script capital L)-->
    <char character="&#x2112;" string="\mathcal{L}"/>
    <!--cursive small l-->
    <char character="&#x2113;" string="\ell"/>
    <!--= \mathds{N} (dsfont), open face N-->
    <char character="&#x2115;" string="\mathbb{N}"/>
    <!--weierstrass p-->
    <char character="&#x2118;" string="\wp"/>
    <!--= \mathds{P} (dsfont), open face P-->
    <char character="&#x2119;" string="\mathbb{P}"/>
    <!--= \mathds{Q} (dsfont), open face Q-->
    <char character="&#x211a;" string="\mathbb{Q}"/>
    <!--/scr R, script capital R-->
    <char character="&#x211b;" string="\mathcal{R}"/>
    <!--= \mathfrak{R} (eufrak), real part-->
    <char character="&#x211c;" string="\Re"/>
    <!--= \mathds{R} (dsfont), open face R-->
    <char character="&#x211d;" string="\mathbb{R}"/>
    <!--= \mathds{Z} (dsfont), open face Z-->
    <char character="&#x2124;" string="\mathbb{Z}"/>
    <!--# \mathrm{\Omega}, ohm (deprecated in math, use greek letter)-->
    <char character="&#x2126;" string="\tcohm"/>
    <!--= \Mho (wrisym), t \agemO (wasysym), conductance-->
    <char character="&#x2127;" string="\mho"/>
    <!--/frak Z, black-letter capital Z-->
    <char character="&#x2128;" string="\mathfrak{Z}"/>
    <!--# \mathring{\mathrm{A}}, Ångström capital A with ring-->
    <char character="&#x212b;" string="\Angstroem"/>
    <!--bernoulli function (script capital B)-->
    <char character="&#x212c;" string="\mathcal{B}"/>
    <!--black-letter capital C-->
    <char character="&#x212d;" string="\mathfrak{C}"/>
    <!--/scr e, script small letter e-->
    <char character="&#x212f;" string="\mathcal{e}"/>
    <!--/scr E, script capital E-->
    <char character="&#x2130;" string="\mathcal{E}"/>
    <!--/scr F, script capital F-->
    <char character="&#x2131;" string="\mathcal{F}"/>
    <!--TURNED CAPITAL F-->
    <char character="&#x2132;" string="\Finv"/>
    <!--physics m-matrix (SCRIPT CAPITAL M)-->
    <char character="&#x2133;" string="\mathcal{M}"/>
    <!--order of (SCRIPT SMALL O)-->
    <char character="&#x2134;" string="\mathcal{o}"/>
    <!--aleph, hebrew-->
    <char character="&#x2135;" string="\aleph"/>
    <!--beth, hebrew-->
    <char character="&#x2136;" string="\beth"/>
    <!--gimel, hebrew-->
    <char character="&#x2137;" string="\gimel"/>
    <!--daleth, hebrew-->
    <char character="&#x2138;" string="\daleth"/>
    <!--\DoublePi (wrisym), DOUBLE-STRUCK SMALL PI-->
    <char character="&#x213c;" string="\mathbb{pi}"/>
    <!--\EulerGamma (wrisym), DOUBLE-STRUCK SMALL GAMMA-->
    <char character="&#x213d;" string="\mathbb{gamma}"/>
    <!--DOUBLE-STRUCK CAPITAL GAMMA-->
    <char character="&#x213e;" string="\mathbb{Gamma}"/>
    <!--DOUBLE-STRUCK CAPITAL PI-->
    <char character="&#x213f;" string="\mathbb{Pi}"/>
    <!--DOUBLE-STRUCK N-ARY SUMMATION-->
    <char character="&#x2140;" string="\mathbb{Sigma}"/>
    <!--TURNED SANS-SERIF CAPITAL G-->
    <char character="&#x2141;" string="\Game"/>
    <!--TURNED SANS-SERIF CAPITAL L-->
    <char character="&#x2142;" string="\sansLturned"/>
    <!--REVERSED SANS-SERIF CAPITAL L-->
    <char character="&#x2143;" string="\sansLmirrored"/>
    <!--TURNED SANS-SERIF CAPITAL Y-->
    <char character="&#x2144;" string="\Yup"/>
    <!--= \DD (wrisym), DOUBLE-STRUCK ITALIC CAPITAL D-->
    <char character="&#x2145;" string="\CapitalDifferentialD"/>
    <!--= \dd (wrisym), DOUBLE-STRUCK ITALIC SMALL D-->
    <char character="&#x2146;" string="\DifferentialD"/>
    <!--= \ee (wrisym), DOUBLE-STRUCK ITALIC SMALL E-->
    <char character="&#x2147;" string="\ExponetialE"/>
    <!--= \ii (wrisym), DOUBLE-STRUCK ITALIC SMALL I-->
    <char character="&#x2148;" string="\ComplexI"/>
    <!--= \jj (wrisym), DOUBLE-STRUCK ITALIC SMALL J-->
    <char character="&#x2149;" string="\ComplexJ"/>
    <!--PROPERTY LINE-->
    <char character="&#x214a;" string="\PropertyLine"/>    
    <!--# \bindnasrepma (stmaryrd), TURNED AMPERSAND-->
    <char character="&#x214b;" string="\invamp"/>
  
    <!-- *
         * Arrows
         * -->
  
    <!--= \gets, a: leftward arrow-->
    <char character="&#x2190;" string="\leftarrow"/>
    <!--upward arrow-->
    <char character="&#x2191;" string="\uparrow"/>
    <!--= \to, = \tfun (oz), = \fun (oz), rightward arrow, z notation total function-->
    <char character="&#x2192;" string="\rightarrow"/>
    <!--downward arrow-->
    <char character="&#x2193;" string="\downarrow"/>
    <!--= \rel (oz), LEFT RIGHT ARROW, z notation relation-->
    <char character="&#x2194;" string="\leftrightarrow"/>
    <!--up and down arrow-->
    <char character="&#x2195;" string="\updownarrow"/>
    <!--nw pointing arrow-->
    <char character="&#x2196;" string="\nwarrow"/>
    <!--ne pointing arrow-->
    <char character="&#x2197;" string="\nearrow"/>
    <!--se pointing arrow-->
    <char character="&#x2198;" string="\searrow"/>
    <!--sw pointing arrow-->
    <char character="&#x2199;" string="\swarrow"/>
    <!--not left arrow-->
    <char character="&#x219a;" string="\nleftarrow"/>
    <!--not right arrow-->
    <char character="&#x219b;" string="\nrightarrow"/>
    <!--left two-headed arrow-->
    <char character="&#x219e;" string="\twoheadleftarrow"/>
    <!--= \tsur (oz), = \surj (oz), right two-headed arrow, z notation total surjection-->
    <char character="&#x21a0;" string="\twoheadrightarrow"/>
    <!--left arrow-tailed-->
    <char character="&#x21a2;" string="\leftarrowtail"/>
    <!--= \tinj (oz), = \inj (oz), right arrow-tailed, z notation total injection-->
    <char character="&#x21a3;" string="\rightarrowtail"/>
    <!--= \mappedfrom (kpfonts), maps to, leftward-->
    <char character="&#x21a4;" string="\mapsfrom"/>
    <!--maps to, upward-->
    <char character="&#x21a5;" string="\MapsUp"/>
    <!--maps to, rightward, z notation maplet-->
    <char character="&#x21a6;" string="\mapsto"/>
    <!--maps to, downward-->
    <char character="&#x21a7;" string="\MapsDown"/>
    <!--UP DOWN ARROW WITH BASE-->
    <char character="&#x21a8;" string="\updownarrowbar"/>    
    <!--left arrow-hooked-->
    <char character="&#x21a9;" string="\hookleftarrow"/>
    <!--right arrow-hooked-->
    <char character="&#x21aa;" string="\hookrightarrow"/>
    <!--left arrow-looped-->
    <char character="&#x21ab;" string="\looparrowleft"/>
    <!--right arrow-looped-->
    <char character="&#x21ac;" string="\looparrowright"/>
    <!--left and right arr-wavy-->
    <char character="&#x21ad;" string="\leftrightsquigarrow"/>
    <!--not left and right arrow-->
    <char character="&#x21ae;" string="\nleftrightarrow"/>
    <!--t \Lightning (marvosym), DOWNWARDS ZIGZAG ARROW-->
    <char character="&#x21af;" string="\lightning"/>
    <!--a: UPWARDS ARROW WITH TIP LEFTWARDS-->
    <char character="&#x21b0;" string="\Lsh"/>
    <!--a: UPWARDS ARROW WITH TIP RIGHTWARDS-->
    <char character="&#x21b1;" string="\Rsh"/>
    <!--left down angled arrow-->
    <char character="&#x21b2;" string="\dlsh"/>
    <!--right down angled arrow-->
    <char character="&#x21b3;" string="\drsh"/>
    <!--left curved arrow-->
    <char character="&#x21b6;" string="\curvearrowleft"/>
    <!--right curved arrow-->
    <char character="&#x21b7;" string="\curvearrowright"/>
    <!--= \leftturn (wasysym), ANTICLOCKWISE OPEN CIRCLE ARROW-->
    <char character="&#x21ba;" string="\circlearrowleft"/>
    <!--= \rightturn (wasysym), CLOCKWISE OPEN CIRCLE ARROW-->
    <char character="&#x21bb;" string="\circlearrowright"/>
    <!--left harpoon-up-->
    <char character="&#x21bc;" string="\leftharpoonup"/>
    <!--left harpoon-down-->
    <char character="&#x21bd;" string="\leftharpoondown"/>
    <!--= \restriction (amssymb), = \upharpoonrightup (wrisym), a: up harpoon-right-->
    <char character="&#x21be;" string="\upharpoonright"/>
    <!--= \upharpoonleftup (wrisym), up harpoon-left-->
    <char character="&#x21bf;" string="\upharpoonleft"/>
    <!--right harpoon-up-->
    <char character="&#x21c0;" string="\rightharpoonup"/>
    <!--right harpoon-down-->
    <char character="&#x21c1;" string="\rightharpoondown"/>
    <!--= \upharpoonrightdown (wrisym), down harpoon-right-->
    <char character="&#x21c2;" string="\downharpoonright"/>
    <!--= \upharpoonleftdown (wrisym), down harpoon-left-->
    <char character="&#x21c3;" string="\downharpoonleft"/>
    <!--= \rightleftarrow (wrisym), right arrow over left arrow-->
    <char character="&#x21c4;" string="\rightleftarrows"/>
    <!--= \uparrowdownarrow (wrisym), up arrow, down arrow-->
    <char character="&#x21c5;" string="\updownarrows"/>
    <!--= \leftrightarrow (wrisym), left arrow over right arrow-->
    <char character="&#x21c6;" string="\leftrightarrows"/>
    <!--two left arrows-->
    <char character="&#x21c7;" string="\leftleftarrows"/>
    <!--two up arrows-->
    <char character="&#x21c8;" string="\upuparrows"/>
    <!--two right arrows-->
    <char character="&#x21c9;" string="\rightrightarrows"/>
    <!--two down arrows-->
    <char character="&#x21ca;" string="\downdownarrows"/>
    <!--= \revequilibrium (wrisym), left harpoon over right-->
    <char character="&#x21cb;" string="\leftrightharpoons"/>
    <!--= \equilibrium (wrisym), right harpoon over left-->
    <char character="&#x21cc;" string="\rightleftharpoons"/>
    <!--not implied by-->
    <char character="&#x21cd;" string="\nLeftarrow"/>
    <!--not left and right double arrows-->
    <char character="&#x21ce;" string="\nLeftrightarrow"/>
    <!--not implies-->
    <char character="&#x21cf;" string="\nRightarrow"/>
    <!--left double arrow-->
    <char character="&#x21d0;" string="\Leftarrow"/>
    <!--up double arrow-->
    <char character="&#x21d1;" string="\Uparrow"/>
    <!--right double arrow-->
    <char character="&#x21d2;" string="\Rightarrow"/>
    <!--down double arrow-->
    <char character="&#x21d3;" string="\Downarrow"/>
    <!--left and right double arrow-->
    <char character="&#x21d4;" string="\Leftrightarrow"/>
    <!--up and down double arrow-->
    <char character="&#x21d5;" string="\Updownarrow"/>
    <!--nw pointing double arrow-->
    <char character="&#x21d6;" string="\Nwarrow"/>
    <!--ne pointing double arrow-->
    <char character="&#x21d7;" string="\Nearrow"/>
    <!--se pointing double arrow-->
    <char character="&#x21d8;" string="\Searrow"/>
    <!--sw pointing double arrow-->
    <char character="&#x21d9;" string="\Swarrow"/>
    <!--left triple arrow-->
    <char character="&#x21da;" string="\Lleftarrow"/>
    <!--right triple arrow-->
    <char character="&#x21db;" string="\Rrightarrow"/>
    <!--LEFTWARDS SQUIGGLE ARROW-->
    <char character="&#x21dc;" string="\leftsquigarrow"/>
    <!--RIGHTWARDS SQUIGGLE ARROW-->
    <char character="&#x21dd;" string="\rightsquigarrow"/>
    <!--LEFTWARDS DASHED ARROW-->
    <char character="&#x21e0;" string="\dashleftarrow"/>
    <!--= \dasharrow (amsfonts), RIGHTWARDS DASHED ARROW-->
    <char character="&#x21e2;" string="\dashrightarrow"/>
    <!--LEFTWARDS ARROW TO BAR-->
    <char character="&#x21e4;" string="\LeftArrowBar"/>
    <!--RIGHTWARDS ARROW TO BAR-->
    <char character="&#x21e5;" string="\RightArrowBar"/>
    <!--= \downarrowuparrow (wrisym), DOWNWARDS ARROW LEFTWARDS OF UPWARDS ARROW-->
    <char character="&#x21f5;" string="\downuparrows"/>
    <!--RIGHTWARDS ARROW WITH VERTICAL STROKE, z notation partial function-->
    <char character="&#x21f8;" string="\pfun"/>
    <!--RIGHTWARDS ARROW WITH DOUBLE VERTICAL STROKE, z notation finite function-->
    <char character="&#x21fb;" string="\ffun"/>
    <!--LEFTWARDS OPEN-HEADED ARROW-->
    <char character="&#x21fd;" string="\leftarrowtriangle"/>
    <!--RIGHTWARDS OPEN-HEADED ARROW-->
    <char character="&#x21fe;" string="\rightarrowtriangle"/>
    <!--LEFT RIGHT OPEN-HEADED ARROW-->
    <char character="&#x21ff;" string="\leftrightarrowtriangle"/>
  
    <!-- *
         * Mathematical Operators
         * -->
  
    <!--FOR ALL-->
    <char character="&#x2200;" string="\forall"/>
    <!--COMPLEMENT sign-->
    <char character="&#x2201;" string="\complement"/>
    <!--# \partial, PARTIAL DIFFERENTIAL-->
    <char character="&#x2202;" string="\partial"/>
    <!--= \exi (oz), at least one exists-->
    <char character="&#x2203;" string="\exists"/>
    <!--= \nexi (oz), negated exists-->
    <char character="&#x2204;" string="\nexists"/>
    <!--circle, slash-->
    <char character="&#x2205;" string="\varnothing"/>
    <!-- INCREMENT, laplace operator -->
    <char character="&#x2206;" string="\Updelta"/>
    <!--NABLA, del, hamilton operator-->
    <char character="&#x2207;" string="\nabla"/>
    <!--set membership, variant-->
    <char character="&#x2208;" string="\in"/>
    <!--= \nin (wrisym), negated set membership-->
    <char character="&#x2209;" string="\notin"/>
    <!-- SMALL ELEMENT OF -->
    <char character="&#x220a;" string="\in"/>
    <!--= \owns, contains, variant-->
    <char character="&#x220b;" string="\ni"/>
    <!--= \notni (txfonts), = \notowner (mathabx), = \notowns (fourier), negated contains, variant-->
    <char character="&#x220c;" string="\notni"/>
    <!-- SMALL CONTAINS AS MEMBER -->
    <char character="&#x220d;" string="\ni"/>
    <!-- END OF PROOF -->
    <char character="&#x220e;" string="\blacksquare"/>
    <!--product operator-->
    <char character="&#x220f;" string="\prod"/>
    <!--coproduct operator-->
    <char character="&#x2210;" string="\coprod"/>
    <!--summation operator-->
    <char character="&#x2211;" string="\sum"/>
    <!--MINUS SIGN-->
    <char character="&#x2212;" string="-"/>
    <!--MINUS-OR-PLUS SIGN-->
    <char character="&#x2213;" string="\mp"/>
    <!--plus sign, dot above-->
    <char character="&#x2214;" string="\dotplus"/>
    <!--DIVISION SLASH-->
    <char character="&#x2215;" string="\slash"/>
    <!--small SET MINUS (cf. reverse solidus)-->
    <char character="&#x2216;" string="\smallsetminus"/>
    <!--ASTERISK OPERATOR (Hodge star operator)-->
    <char character="&#x2217;" string="\ast"/>
    <!--composite function (small circle)-->
    <char character="&#x2218;" string="\circ"/>
    <!--BULLET OPERATOR-->  <!-- authors frequently mix the bullet with the multiplication dot -->
    <char character="&#x2219;" string="\cdot"/>
    <!--radical-->
    <char character="&#x221a;" string="\sqrt"/>
    <!--CUBE ROOT-->
    <char character="&#x221b;" string="\sqrt[3]"/>
    <!--FOURTH ROOT-->
    <char character="&#x221c;" string="\sqrt[4]"/>
    <!--# \varpropto (amssymb), is PROPORTIONAL TO-->
    <char character="&#x221d;" string="\propto"/>
    <!--INFINITY-->
    <char character="&#x221e;" string="\infty"/>
    <!--right (90 degree) angle-->
    <char character="&#x221f;" string="\llcorner"/>
    <!--ANGLE-->
    <char character="&#x2220;" string="\angle"/>
    <!--MEASURED ANGLE-->
    <char character="&#x2221;" string="\measuredangle"/>
    <!--SPHERICAL ANGLE-->
    <char character="&#x2222;" string="\sphericalangle"/>
    <!--r: DIVIDES-->
    <char character="&#x2223;" string="\mid"/>
    <!--negated mid, DOES NOT DIVIDE-->
    <char character="&#x2224;" string="\nmid"/>
    <!--parallel-->
    <char character="&#x2225;" string="\parallel"/>
    <!--not parallel-->
    <char character="&#x2226;" string="\nparallel"/>
    <!--= \land, b: LOGICAL AND-->
    <char character="&#x2227;" string="\wedge"/>
    <!--= \lor, b: LOGICAL OR-->
    <char character="&#x2228;" string="\vee"/>
    <!--INTERSECTION-->
    <char character="&#x2229;" string="\cap"/>
    <!--UNION or logical sum-->
    <char character="&#x222a;" string="\cup"/>
    <!--INTEGRAL operator-->
    <char character="&#x222b;" string="\int"/>
    <!--DOUBLE INTEGRAL operator-->
    <char character="&#x222c;" string="\iint"/>
    <!--TRIPLE INTEGRAL operator-->
    <char character="&#x222d;" string="\iiint"/>
    <!--CONTOUR INTEGRAL operator-->
    <char character="&#x222e;" string="\oint"/>
    <!--= \dbloint (wrisym), double contour integral operator-->
    <char character="&#x222f;" string="\oiint"/>
    <!--triple contour integral operator-->
    <char character="&#x2230;" string="\oiiint"/>
    <!--= \clockoint (wrisym), contour integral, clockwise-->
    <char character="&#x2232;" string="\varointclockwise"/>
    <!--= \cntclockoint (wrisym), contour integral, anticlockwise-->
    <char character="&#x2233;" string="\ointctrclockwise"/>
    <!--= \wasytherefore (wasysym), THEREFORE-->
    <char character="&#x2234;" string="\therefore"/>
    <!--BECAUSE-->
    <char character="&#x2235;" string="\because"/>
    <!--x \colon, RATIO-->
    <char character="&#x2236;" string=":"/>
    <!--# ::, two colons-->
    <char character="&#x2237;" string="::"/>
    <!-- DOT MINUS -->
    <char character="&#x2238;" string="\dot{-}"/>
    <!--# -: ,EXCESS-->
    <char character="&#x2239;" string="\eqcolon"/>
    <!--similar to, TILDE OPERATOR-->
    <char character="&#x223c;" string="\sim"/>
    <!--reverse similar-->
    <char character="&#x223d;" string="\backsim"/>
    <!--SINE WAVE, alternating current-->
    <char character="&#x223f;" string="\AC"/>
    <!--WREATH PRODUCT-->
    <char character="&#x2240;" string="\wr"/>
    <!--not similar-->
    <char character="&#x2241;" string="\nsim"/>
    <!--equals, similar-->
    <char character="&#x2242;" string="\eqsim"/>
    <!--similar, equals-->
    <char character="&#x2243;" string="\simeq"/>
    <!--not similar, equals-->
    <char character="&#x2244;" string="\nsimeq"/>
    <!--congruent with-->
    <char character="&#x2245;" string="\cong"/>
    <!--not congruent with-->
    <char character="&#x2247;" string="\ncong"/>
    <!--approximate-->
    <char character="&#x2248;" string="\approx"/>
    <!--not approximate-->
    <char character="&#x2249;" string="\napprox"/>
    <!--approximate, equals-->
    <char character="&#x224a;" string="\approxeq"/>
    <!--asymptotically equal to-->
    <char character="&#x224d;" string="\asymp"/>
    <!--bumpy equals-->
    <char character="&#x224e;" string="\Bumpeq"/>
    <!--bumpy equals, equals-->
    <char character="&#x224f;" string="\bumpeq"/>
    <!--= \dotequal (wrisym), equals, single dot above-->
    <char character="&#x2250;" string="\doteq"/>
    <!--= \doteqdot (amssymb), /doteq r: equals, even dots-->
    <char character="&#x2251;" string="\Doteq"/>
    <!--equals, falling dots-->
    <char character="&#x2252;" string="\fallingdotseq"/>
    <!--equals, rising dots-->
    <char character="&#x2253;" string="\risingdotseq"/>
    <!--= \coloneqq (txfonts), = \SetDelayed (wrisym), # := colon, equals-->
    <char character="&#x2254;" string="\coloneqq"/>
    <!--= \eqqcolon (txfonts), # =:, equals, colon-->
    <char character="&#x2255;" string="\eqcolon"/>
    <!--circle on equals sign-->
    <char character="&#x2256;" string="\eqcirc"/>
    <!--circle, equals-->
    <char character="&#x2257;" string="\circeq"/>
    <!--= \sdef (oz), t \Corresponds (marvosym), corresponds to (wedge over equals)-->
    <char character="&#x2259;" string="\corresponds"/>
    <!--= \varsdef (oz), triangle, equals-->
    <char character="&#x225c;" string="\triangleq"/>
    <!--= \ne, r: not equal-->
    <char character="&#x2260;" string="\neq"/>
    <!--identical with-->
    <char character="&#x2261;" string="\equiv"/>
    <!--not identical with-->
    <char character="&#x2262;" string="\nequiv"/>
    <!--= \le, r: less-than-or-equal-->
    <char character="&#x2264;" string="\leq"/>
    <!--= \ge, r: greater-than-or-equal-->
    <char character="&#x2265;" string="\geq"/>
    <!--less, double equals-->
    <char character="&#x2266;" string="\leqq"/>
    <!--greater, double equals-->
    <char character="&#x2267;" string="\geqq"/>
    <!--less, not double equals-->
    <char character="&#x2268;" string="\lneqq"/>
    <!--greater, not double equals-->
    <char character="&#x2269;" string="\gneqq"/>
    <!--much less than, type 2-->
    <char character="&#x226a;" string="\ll"/>
    <!--much greater than, type 2-->
    <char character="&#x226b;" string="\gg"/>
    <!--BETWEEN-->
    <char character="&#x226c;" string="\between"/>
    <!--= \nasymp (wrisym), not asymptotically equal to-->
    <char character="&#x226d;" string="\notasymp"/>
    <!--NOT LESS-THAN-->
    <char character="&#x226e;" string="\nless"/>
    <!--NOT GREATER-THAN-->
    <char character="&#x226f;" string="\ngtr"/>
    <!--= \nleqslant (fourier), not less-than-or-equal-->
    <char character="&#x2270;" string="\nleq"/>
    <!--= \ngeqslant (fourier), not greater-than-or-equal-->
    <char character="&#x2271;" string="\ngeq"/>
    <!--= \apprle (wasysym), = \LessTilde (wrisym), less, similar-->
    <char character="&#x2272;" string="\lesssim"/>
    <!--= \apprge (wasysym), = \GreaterTilde (wrisym), greater, similar-->
    <char character="&#x2273;" string="\gtrsim"/>
    <!--not less, similar-->
    <char character="&#x2274;" string="\NotLessTilde"/>
    <!--not greater, similar-->
    <char character="&#x2275;" string="\NotGreaterTilde"/>
    <!--less, greater-->
    <char character="&#x2276;" string="\lessgtr"/>
    <!--= \GreaterLess (wrisym), greater, less-->
    <char character="&#x2277;" string="\gtrless"/>
    <!--not greater, less-->
    <char character="&#x2279;" string="\NotGreaterLess"/>
    <!--PRECEDES-->
    <char character="&#x227a;" string="\prec"/>
    <!--SUCCEEDS-->
    <char character="&#x227b;" string="\succ"/>
    <!--= \PrecedesSlantEqual (wrisym), precedes, curly equals-->
    <char character="&#x227c;" string="\preccurlyeq"/>
    <!--= \SucceedsSlantEqual (wrisym), succeeds, curly equals-->
    <char character="&#x227d;" string="\succcurlyeq"/>
    <!--= \PrecedesTilde (wrisym), precedes, similar-->
    <char character="&#x227e;" string="\precsim"/>
    <!--= \SucceedsTilde (wrisym), succeeds, similar-->
    <char character="&#x227f;" string="\succsim"/>
    <!--not precedes-->
    <char character="&#x2280;" string="\nprec"/>
    <!--not succeeds-->
    <char character="&#x2281;" string="\nsucc"/>
    <!--subset or is implied by-->
    <char character="&#x2282;" string="\subset"/>
    <!--superset or implies-->
    <char character="&#x2283;" string="\supset"/>
    <!--not subset, variant [slash negation]-->
    <char character="&#x2284;" string="\nsubset"/>
    <!--not superset, variant [slash negation]-->
    <char character="&#x2285;" string="\nsupset"/>
    <!--subset, equals-->
    <char character="&#x2286;" string="\subseteq"/>
    <!--superset, equals-->
    <char character="&#x2287;" string="\supseteq"/>
    <!--not subset, equals-->
    <char character="&#x2288;" string="\nsubseteq"/>
    <!--not superset, equals-->
    <char character="&#x2289;" string="\nsupseteq"/>
    <!--= \varsubsetneq (fourier), subset, not equals-->
    <char character="&#x228a;" string="\subsetneq"/>
    <!--superset, not equals-->
    <char character="&#x228b;" string="\supsetneq"/>
    <!--= \buni (oz), plus sign in union-->
    <char character="&#x228e;" string="\uplus"/>
    <!--square subset-->
    <char character="&#x228f;" string="\sqsubset"/>
    <!--square superset-->
    <char character="&#x2290;" string="\sqsupset"/>
    <!--square subset, equals-->
    <char character="&#x2291;" string="\sqsubseteq"/>
    <!--square superset, equals-->
    <char character="&#x2292;" string="\sqsupseteq"/>
    <!--square intersection-->
    <char character="&#x2293;" string="\sqcap"/>
    <!--square union-->
    <char character="&#x2294;" string="\sqcup"/>
    <!--plus sign in circle-->
    <char character="&#x2295;" string="\oplus"/>
    <!--minus sign in circle-->
    <char character="&#x2296;" string="\ominus"/>
    <!--multiply sign in circle-->
    <char character="&#x2297;" string="\otimes"/>
    <!--solidus in circle-->
    <char character="&#x2298;" string="\oslash"/>
    <!--middle dot in circle-->
    <char character="&#x2299;" string="\odot"/>
    <!--small circle in circle-->
    <char character="&#x229a;" string="\circledcirc"/>
    <!--asterisk in circle-->
    <char character="&#x229b;" string="\circledast"/>
    <!--hyphen in circle-->
    <char character="&#x229d;" string="\circleddash"/>
    <!--plus sign in box-->
    <char character="&#x229e;" string="\boxplus"/>
    <!--minus sign in box-->
    <char character="&#x229f;" string="\boxminus"/>
    <!--multiply sign in box-->
    <char character="&#x22a0;" string="\boxtimes"/>
    <!--/dotsquare /boxdot b: small dot in box-->
    <char character="&#x22a1;" string="\boxdot"/>
    <!--RIGHT TACK, proves, implies, yields, (vertical, dash)-->
    <char character="&#x22a2;" string="\vdash"/>
    <!--LEFT TACK, non-theorem, does not yield, (dash, vertical)-->
    <char character="&#x22a3;" string="\dashv"/>
    <!--DOWN TACK, top-->
    <char character="&#x22a4;" string="\top"/>
    <!--UP TACK, bottom-->
    <char character="&#x22a5;" string="\bot"/>
    <!--MODELS (vertical, short double dash)-->
    <char character="&#x22a7;" string="\models"/>
    <!--TRUE (vertical, double dash)-->
    <char character="&#x22a8;" string="\vDash"/>
    <!--double vertical, dash-->
    <char character="&#x22a9;" string="\Vdash"/>
    <!--triple vertical, dash-->
    <char character="&#x22aa;" string="\Vvdash"/>
    <!--double vert, double dash-->
    <char character="&#x22ab;" string="\VDash"/>
    <!--not vertical, dash-->
    <char character="&#x22ac;" string="\nvdash"/>
    <!--not vertical, double dash-->
    <char character="&#x22ad;" string="\nvDash"/>
    <!--not double vertical, dash-->
    <char character="&#x22ae;" string="\nVdash"/>
    <!--not double vert, double dash-->
    <char character="&#x22af;" string="\nVDash"/>
    <!--left triangle, open, variant-->
    <char character="&#x22b2;" string="\vartriangleleft"/>
    <!--right triangle, open, variant-->
    <char character="&#x22b3;" string="\vartriangleright"/>
    <!--= \unlhd (wrisym), left triangle, equals-->
    <char character="&#x22b4;" string="\trianglelefteq"/>
    <!--= \unrhd (wrisym), right triangle, equals-->
    <char character="&#x22b5;" string="\trianglerighteq"/>
    <!--ORIGINAL OF-->
    <char character="&#x22b6;" string="\multimapdotbothA"/>
    <!--IMAGE OF-->
    <char character="&#x22b7;" string="\multimapdotbothB"/>
    <!--/MULTIMAP a:-->
    <char character="&#x22b8;" string="\multimap"/>
    <!--intercal-->
    <char character="&#x22ba;" string="\intercal"/>
    <!--logical or, bar below (large vee); exclusive disjunction-->
    <char character="&#x22bb;" string="\veebar"/>
    <!--logical NAND (bar over wedge)-->
    <char character="&#x22bc;" string="\barwedge"/>
    <!--logical or operator-->
    <char character="&#x22c0;" string="\bigwedge"/>
    <!--logical and operator-->
    <char character="&#x22c1;" string="\bigvee"/>
    <!--= \dint (oz), \dinter (oz), intersection operator-->
    <char character="&#x22c2;" string="\bigcap"/>
    <!--= \duni (oz), \dunion (oz), union operator-->
    <char character="&#x22c3;" string="\bigcup"/>
    <!--DIAMOND OPERATOR (white diamond)-->
    <char character="&#x22c4;" string="\diamond"/>
    <!--DOT OPERATOR (small middle dot)-->
    <char character="&#x22c5;" string="\cdot"/>
    <!--small star, filled, low-->
    <char character="&#x22c6;" string="\star"/>
    <!--division on times-->
    <char character="&#x22c7;" string="\divideontimes"/>
    <!--= \lrtimes (txfonts), BOWTIE-->
    <char character="&#x22c8;" string="\bowtie"/>
    <!--times sign, left closed-->
    <char character="&#x22c9;" string="\ltimes"/>
    <!--times sign, right closed-->
    <char character="&#x22ca;" string="\rtimes"/>
    <!--LEFT SEMIDIRECT PRODUCT-->
    <char character="&#x22cb;" string="\leftthreetimes"/>
    <!--RIGHT SEMIDIRECT PRODUCT-->
    <char character="&#x22cc;" string="\rightthreetimes"/>
    <!--reverse similar, equals-->
    <char character="&#x22cd;" string="\backsimeq"/>
    <!--CURLY LOGICAL OR-->
    <char character="&#x22ce;" string="\curlyvee"/>
    <!--CURLY LOGICAL AND-->
    <char character="&#x22cf;" string="\curlywedge"/>
    <!--DOUBLE SUBSET-->
    <char character="&#x22d0;" string="\Subset"/>
    <!--DOUBLE SUPERSET-->
    <char character="&#x22d1;" string="\Supset"/>
    <!--/cap /doublecap b: DOUBLE INTERSECTION-->
    <char character="&#x22d2;" string="\Cap"/>
    <!--/cup /doublecup b: DOUBLE UNION-->
    <char character="&#x22d3;" string="\Cup"/>
    <!--PITCHFORK-->
    <char character="&#x22d4;" string="\pitchfork"/>
    <!--parallel, equal; equal or parallel-->
    <char character="&#x22d5;" string="\hash"/>
    <!--less than, with dot-->
    <char character="&#x22d6;" string="\lessdot"/>
    <!--greater than, with dot-->
    <char character="&#x22d7;" string="\gtrdot"/>
    <!--triple less-than-->
    <char character="&#x22d8;" string="\lll"/>
    <!--triple greater-than-->
    <char character="&#x22d9;" string="\ggg"/>
    <!--less, equals, greater-->
    <char character="&#x22da;" string="\lesseqgtr"/>
    <!--greater, equals, less-->
    <char character="&#x22db;" string="\gtreqless"/>
    <!--curly equals, precedes-->
    <char character="&#x22de;" string="\curlyeqprec"/>
    <!--curly equals, succeeds-->
    <char character="&#x22df;" string="\curlyeqsucc"/>
    <!--DOES NOT PRECEDE OR EQUAL-->
    <char character="&#x22e0;" string="\npreceq"/>
    <!--not succeeds, curly equals-->
    <char character="&#x22e1;" string="\nsucceq"/>
    <!--not, square subset, equals-->
    <char character="&#x22e2;" string="\nsqsubseteq"/>
    <!--not, square superset, equals-->
    <char character="&#x22e3;" string="\nsqsupseteq"/>
    <!--less, not similar-->
    <char character="&#x22e6;" string="\lnsim"/>
    <!--greater, not similar-->
    <char character="&#x22e7;" string="\gnsim"/>
    <!--precedes, not similar-->
    <char character="&#x22e8;" string="\precnsim"/>
    <!--succeeds, not similar-->
    <char character="&#x22e9;" string="\succnsim"/>
    <!--= \NotLeftTriangle (wrisym), not left triangle-->
    <char character="&#x22ea;" string="\ntriangleleft"/>
    <!--= \NotRightTriangle (wrisym), not right triangle-->
    <char character="&#x22eb;" string="\ntriangleright"/>
    <!--= \nunlhd (wrisym), not left triangle, equals-->
    <char character="&#x22ec;" string="\ntrianglelefteq"/>
    <!--= \nunrhd (wrisym), not right triangle, equals-->
    <char character="&#x22ed;" string="\ntrianglerighteq"/>
    <!--VERTICAL ELLIPSIS-->
    <char character="&#x22ee;" string="\vdots"/>
    <!--three dots, centered-->
    <char character="&#x22ef;" string="\cdots"/>
    <!--= \adots (yhmath), three dots, ascending-->
    <char character="&#x22f0;" string="\iddots"/>
    <!--three dots, descending-->
    <char character="&#x22f1;" string="\ddots"/>
    <!--ELEMENT OF WITH OVERBAR-->
    <char character="&#x22f6;" string="\barin"/>
  
    <!-- *
          * Miscellaneous Technical
          * -->
  
    <!--# \varnothing (amssymb), DIAMETER SIGN-->
    <char character="&#x2300;" string="\diameter"/>
    <!--HOUSE-->
    <char character="&#x2302;" string="\house"/>
    <!--LEFT CEILING-->
    <char character="&#x2308;" string="\lceil"/>
    <!--RIGHT CEILING-->
    <char character="&#x2309;" string="\rceil"/>
    <!--LEFT FLOOR-->
    <char character="&#x230a;" string="\lfloor"/>
    <!--RIGHT FLOOR-->
    <char character="&#x230b;" string="\rfloor"/>
    <!--REVERSE NOT-->
    <char character="&#x2310;" string="\invneg"/>
    <!--SQUARE LOZENGE-->
    <char character="&#x2311;" string="\wasylozenge"/>
    <!--PROFILE OF A LINE-->
    <char character="&#x2312;" string="\profline"/>
    <!--PROFILE OF A SURFACE-->
    <char character="&#x2313;" string="\profsurf"/>
    <!--VIEWDATA SQUARE-->
    <char character="&#x2317;" string="\viewdata"/>
    <!--TURNED NOT SIGN-->
    <char character="&#x2319;" string="\turnednot"/>
    <!--TOP HALF INTEGRAL-->
    <char character="&#x2320;" string="\inttop"/>
    <!--BOTTOM HALF INTEGRAL-->
    <char character="&#x2321;" string="\intbottom"/>    
    <!--upper left corner-->
    <char character="&#x231c;" string="\ulcorner"/>
    <!--upper right corner-->
    <char character="&#x231d;" string="\urcorner"/>
    <!--lower left corner-->
    <char character="&#x231e;" string="\llcorner"/>
    <!--lower right corner-->
    <char character="&#x231f;" string="\lrcorner"/>
    <!--# \smallFROWN, down curve-->
    <char character="&#x2322;" string="\frown"/>
    <!--# \smallSMILE, up curve-->
    <char character="&#x2323;" string="\smile"/>
    <!-- LEFT-POINTING ANGLE BRACKET -->
    <char character="&#x2329;" string="\langle"/>
    <!-- RIGHT-POINTING ANGLE BRACKET -->
    <char character="&#x232a;" string="\rangle"/>
    <!--BENZENE RING-->
    <char character="&#x232c;" string="\varhexagonlrbonds"/>
    <!--CONICAL TAPER-->
    <char character="&#x2332;" string="\conictaper"/>
    <!--TOP AND BOTTOM-->
    <char character="&#x2336;" string="\topbot"/>
    <!--APL FUNCTIONAL SYMBOL QUAD DIVIDE-->
    <char character="&#x2339;" string="\APLinv"/>
    <!--APL FUNCTIONAL SYMBOL SLASH BAR, solidus, bar through-->
    <char character="&#x233f;" string="\notslash"/>
    <!--APL FUNCTIONAL SYMBOL BACKSLASH BAR-->
    <char character="&#x2340;" string="\APLnotbackslash"/>
    <!--APL FUNCTIONAL SYMBOL QUAD LEFTWARDS ARROW-->
    <char character="&#x2347;" string="\APLleftarrowbox"/>
    <!--APL FUNCTIONAL SYMBOL QUAD RIGHTWARDS ARROW-->
    <char character="&#x2348;" string="\APLrightarrowbox"/>
    <!--APL FUNCTIONAL SYMBOL QUAD UPWARDS ARROW-->
    <char character="&#x2350;" string="\APLuparrowbox"/>
    <!--APL FUNCTIONAL SYMBOL QUAD UP CARET-->
    <char character="&#x2353;" string="\APLboxupcaret"/>
    <!--APL FUNCTIONAL SYMBOL QUAD DOWNWARDS ARROW-->
    <char character="&#x2357;" string="\APLdownarrowbox"/>
    <!--APL FUNCTIONAL SYMBOL UP SHOE JOT-->
    <char character="&#x235d;" string="\APLcomment"/>
    <!--APL FUNCTIONAL SYMBOL QUOTE QUAD-->
    <char character="&#x235e;" string="\APLinput"/>
    <!--APL FUNCTIONAL SYMBOL CIRCLE STAR-->
    <char character="&#x235f;" string="\APLlog"/>
    <!--APL FUNCTIONAL SYMBOL QUAD QUESTION-->
    <char character="&#x2370;" string="\APLboxquestion"/>
    <!--APL FUNCTIONAL SYMBOL ALPHA-->
    <char character="&#x237a;" string="\upalpha"/>
    <!--RIGHT ANGLE WITH DOWNWARDS ZIGZAG ARROW-->
    <char character="&#x237c;" string="\rangledownzigzagarrow"/>
    <!--SOFTWARE-FUNCTION SYMBOL, HEXAGON-->
    <char character="&#x2394;" string="\hexagon"/>
    <!-- APL FUNCTIONAL SYMBOL ALPHA -->    
    <char character="&#x237a;" string="\upalpha"/>
    <!--= \wideparen (yhmath mathabx fourier), TOP PARENTHESIS (mathematical use)-->
    <char character="&#x23dc;" string="\overparen"/>
    <!--BOTTOM PARENTHESIS (mathematical use)-->
    <char character="&#x23dd;" string="\underparen"/>
    <!--TOP CURLY BRACKET (mathematical use)-->
    <char character="&#x23de;" string="\overbrace"/>
    <!--BOTTOM CURLY BRACKET (mathematical use)-->
    <char character="&#x23df;" string="\underbrace"/>
  
    <!--  *
          * Enclosed Alphanumerics
          * -->
  
  
  
    <!--  *
          * Box Drawing
          * -->
  
    <!-- BOX DRAWINGS LIGHT VERTICAL -->
    <char character="&#x2502;" string="\textbar"/>
  
    <!--  *
          * Block Elements
          * -->
  
  
  
    <!--  *
          * Geometric Shapes
          * -->
    <!-- BLACK SQUARE -->
    <char character="&#x25a0;" string="\blacksquare"/>
    <!-- WHITE SQUARE -->
    <char character="&#x25a1;" string="\square"/>
    <!-- BLACK SMALL SQUARE -->
    <char character="&#x25aa;" string="\blacksquare"/>
  
    <!--= \triangle (amsfonts), # \vartriangle (amssymb), big up triangle, open-->
    <char character="&#x25b3;" string="\bigtriangleup"/>
    <!--up triangle, filled-->
    <char character="&#x25b4;" string="\blacktriangleup"/>
    <!--# \vartriangle (amssymb), small up triangle, open-->
    <char character="&#x25b5;" string="\smalltriangleup"/>
    <!--= \blacktriangleright (fourier -mathabx), (large) right triangle, filled-->
    <char character="&#x25b6;" string="\RHD"/>
    <!--= \rres (oz), = \RightTriangle (wrisym), (large) right triangle, open; z notation range restriction-->
    <char character="&#x25b7;" string="\rhd"/>
    <!--right triangle, filled-->
    <char character="&#x25b8;" string="\blacktriangleright"/>
    <!--# \triangleright, x \triangleright (mathabx), right triangle, open-->
    <char character="&#x25b9;" string="\smalltriangleright"/>
    <!--big down triangle, open-->
    <char character="&#x25bd;" string="\bigtriangledown"/>
    <!--BLACK DOWN-POINTING SMALL TRIANGLE-->
    <char character="&#x25be;" string="\blacktriangledown"/>
    <!--# \triangledown (amssymb), WHITE DOWN-POINTING SMALL TRIANGLE-->
    <char character="&#x25bf;" string="\smalltriangledown"/>
    <!--= \blacktriangleleft (fourier -mathabx), (large) left triangle, filled-->
    <char character="&#x25c0;" string="\LHD"/>
    <!--= \dres (oz), = \LeftTriangle (wrisym), (large) left triangle, open; z notation domain restriction-->
    <char character="&#x25c1;" string="\lhd"/>
    <!--left triangle, filled-->
    <char character="&#x25c2;" string="\blacktriangleleft"/>
    <!--# \triangleleft, x \triangleleft (mathabx), left triangle, open-->
    <char character="&#x25c3;" string="\smalltriangleleft"/>
    <!--BLACK DIAMOND-->
    <char character="&#x25c6;" string="\Diamondblack"/>
    <!--WHITE DIAMOND; diamond, open-->
    <char character="&#x25c7;" string="\Diamond"/>
    <!--LOZENGE or total mark-->
    <char character="&#x25ca;" string="\lozenge"/>
    <!--medium large circle-->
    <char character="&#x25cb;" string="\Circle"/>
    <!--circle, filled-->
    <char character="&#x25cf;" string="\CIRCLE"/>
    <!--circle, filled left half [harvey ball]-->
    <char character="&#x25d0;" string="\LEFTcircle"/>
    <!--circle, filled right half-->
    <char character="&#x25d1;" string="\RIGHTcircle"/>
    <!--LEFT HALF BLACK CIRCLE-->
    <char character="&#x25d6;" string="\LEFTCIRCLE"/>
    <!--RIGHT HALF BLACK CIRCLE-->
    <char character="&#x25d7;" string="\RIGHTCIRCLE"/>
    <!--vertical bar in box-->
    <char character="&#x25eb;" string="\boxbar"/>
    <!--WHITE MEDIUM SQUARE-->
    <char character="&#x25fb;" string="\square"/>
    <!--BLACK MEDIUM SQUARE-->
    <char character="&#x25fc;" string="\blacksquare"/>
  
    <!-- *
          * Miscellaneous Symbols
          * -->
  
    <!--star, filled-->
    <char character="&#x2605;" string="\bigstar"/>
    <!--SUN-->
    <char character="&#x2609;" string="\Sun"/>
    <!--BLACK TELEPHONE -->
    <char character="&#x260e;" string="\phone"/>
    <!--WHITE TELEPHONE -->
    <char character="&#x260f;" string="\phone"/>
    <!--BALLOT BOX-->
    <char character="&#x2610;" string="\Square"/>
    <!--t \Checkedbox (marvosym), BALLOT BOX WITH CHECK-->
    <char character="&#x2611;" string="\CheckedBox"/>
    <!--t \Crossedbox (marvosym), BALLOT BOX WITH X-->
    <char character="&#x2612;" string="\XBox"/>
    <!--HOT BEVERAGE-->
    <char character="&#x2615;" string="\steaming"/>
    <!--WHITE RIGHT POINTING INDEX-->
    <char character="&#x261e;" string="\pointright"/>
    <!--SKULL AND CROSSBONES-->
    <char character="&#x2620;" string="\skull"/>
    <!--RADIOACTIVE SIGN-->
    <char character="&#x2622;" string="\radiation"/>
    <!--BIOHAZARD SIGN-->
    <char character="&#x2623;" string="\biohazard"/>
    <!--YIN YANG-->
    <char character="&#x262f;" string="\yinyang"/>
    <!--= \sadface (arevmath), WHITE FROWNING FACE-->
    <char character="&#x2639;" string="\frownie"/>
    <!--= \smileface (arevmath), WHITE SMILING FACE-->
    <char character="&#x263a;" string="\smiley"/>
    <!--= \invsmileface (arevmath), BLACK SMILING FACE-->
    <char character="&#x263b;" string="\blacksmiley"/>
    <!--WHITE SUN WITH RAYS-->
    <char character="&#x263c;" string="\sun"/>
    <!--FIRST QUARTER MOON-->
    <char character="&#x263d;" string="\rightmoon"/>
    <!--LAST QUARTER MOON-->
    <char character="&#x263e;" string="\leftmoon"/>
    <!--= \Mercury (mathabx), MERCURY-->
    <char character="&#x263f;" string="\mercury"/>
    <!--= \Venus (mathabx), = \girl (mathabx), venus, female-->
    <char character="&#x2640;" string="\female"/>
    <!--= \varEarth (mathabx), EARTH-->
    <char character="&#x2641;" string="\earth"/>
    <!--= \Mars (mathabx), = \boy (mathabx), mars, male-->
    <char character="&#x2642;" string="\male"/>
    <!--= \Jupiter (mathabx), JUPITER-->
    <char character="&#x2643;" string="\jupiter"/>
    <!--= \Saturn (mathabx), SATURN-->
    <char character="&#x2644;" string="\saturn"/>
    <!--= \Uranus (mathabx), URANUS-->
    <char character="&#x2645;" string="\uranus"/>
    <!--= \Neptune (mathabx), NEPTUNE-->
    <char character="&#x2646;" string="\neptune"/>
    <!--= \Pluto (mathabx), PLUTO-->
    <char character="&#x2647;" string="\pluto"/>
    <!--= \Aries (mathabx), ARIES-->
    <char character="&#x2648;" string="\aries"/>
    <!--= \Taurus (mathabx), TAURUS-->
    <char character="&#x2649;" string="\taurus"/>
    <!--= \Gemini (mathabx), GEMINI-->
    <char character="&#x264a;" string="\gemini"/>
    <!--CANCER-->
    <char character="&#x264b;" string="\cancer"/>
    <!--= \Leo (mathabx), LEO-->
    <char character="&#x264c;" string="\leo"/>
    <!--VIRGO-->
    <char character="&#x264d;" string="\virgo"/>
    <!--= \Libra (mathabx), LIBRA-->
    <char character="&#x264e;" string="\libra"/>
    <!--= \Scorpio (mathabx), SCORPIUS-->
    <char character="&#x264f;" string="\scorpio"/>
    <!--SAGITTARIUS-->
    <char character="&#x2650;" string="\sagittarius"/>
    <!--CAPRICORN-->
    <char character="&#x2651;" string="\capricornus"/>
    <!--AQUARIUS-->
    <char character="&#x2652;" string="\aquarius"/>
    <!--PISCES-->
    <char character="&#x2653;" string="\pisces"/>
    <!--spades suit symbol-->
    <char character="&#x2660;" string="\spadesuit"/>
    <!--heart suit symbol-->
    <char character="&#x2661;" string="\heartsuit"/>
    <!--diamond suit symbol-->
    <char character="&#x2662;" string="\diamondsuit"/>
    <!--club suit symbol-->
    <char character="&#x2663;" string="\clubsuit"/>
    <!--= \varspade (arevmath), spade, white (card suit)-->
    <char character="&#x2664;" string="\varspadesuit"/>
    <!--= \varheart (arevmath), filled heart (card suit)-->
    <char character="&#x2665;" string="\varheartsuit"/>
    <!--= \vardiamond (arevmath), filled diamond (card suit)-->
    <char character="&#x2666;" string="\blacklozenge"/>
    <!--= \varclub (arevmath), club, white (card suit)-->
    <char character="&#x2667;" string="\varclubsuit"/>
    <!--music note (sung text sign)-->
    <char character="&#x2669;" string="\quarternote"/>
    <!--EIGHTH NOTE-->
    <char character="&#x266a;" string="\eighthnote"/>
    <!--BEAMED EIGHTH NOTES-->
    <char character="&#x266b;" string="\twonotes"/>
    <!--BEAMED SIXTEENTH NOTES-->
    <char character="&#x266c;" string="\sixteenthnote"/>
    <!--musical flat-->
    <char character="&#x266d;" string="\flat"/>
    <!--music natural-->
    <char character="&#x266e;" string="\natural"/>
    <!--# \# (oz), musical sharp, z notation infix bag count-->
    <char character="&#x266f;" string="\sharp"/>
    <!--BLACK UNIVERSAL RECYCLING SYMBOL-->
    <char character="&#x267b;" string="\recycle"/>
    <!--ANCHOR-->
    <char character="&#x2693;" string="\anchor"/>
    <!--CROSSED SWORDS-->
    <char character="&#x2694;" string="\swords"/>
    <!--WARNING SIGN-->
    <char character="&#x26a0;" string="\warning"/>
    <!--MEDIUM WHITE CIRCLE-->
    <char character="&#x26aa;" string="\medcirc"/>
    <!--MEDIUM BLACK CIRCLE-->
    <char character="&#x26ab;" string="\medbullet"/>
  
    <!-- *
          * Dingbats
          * -->
  
    <!--LOWER RIGHT PENCIL-->
    <char character="&#x270e;" string="\pencil"/>
    <!--= \ballotcheck (arevmath), tick, CHECK MARK-->
    <char character="&#x2713;" string="\checkmark"/>
    <!--BALLOT X-->
    <char character="&#x2717;" string="\ballotx"/>
    <!--MALTESE CROSS-->
    <char character="&#x2720;" string="\maltese"/>
    <!--THREE-D TOP-LIGHTED RIGHTWARDS ARROWHEAD-->
    <char character="&#x27a2;" string="\arrowbullet"/>
  
    <!-- *
          * Miscellaneous Mathematical Symbols-A
          * -->
  
    <!--PERPENDICULAR-->
    <char character="&#x27c2;" string="\perp"/>
    <!--= \lbag (stmaryrd -oz), LEFT S-SHAPED BAG DELIMITER-->
    <char character="&#x27c5;" string="\Lbag"/>
    <!--= \rbag (stmaryrd -oz), RIGHT S-SHAPED BAG DELIMITER-->
    <char character="&#x27c6;" string="\Rbag"/>
    <!--WHITE DIAMOND WITH CENTRED DOT-->
    <char character="&#x27d0;" string="\Diamonddot"/>
    <!--LEFT MULTIMAP-->
    <char character="&#x27dc;" string="\multimapinv"/>
    <!--= \Lbrack (mathbbol), = \lbag (oz -stmaryrd), MATHEMATICAL LEFT WHITE SQUARE BRACKET-->
    <char character="&#x27e6;" string="\llbracket"/>
    <!--= \Rbrack (mathbbol), = \rbag (oz -stmaryrd), MATHEMATICAL RIGHT WHITE SQUARE BRACKET-->
    <char character="&#x27e7;" string="\rrbracket"/>
    <!--MATHEMATICAL LEFT ANGLE BRACKET-->
    <char character="&#x27e8;" string="\langle"/>
    <!--MATHEMATICAL RIGHT ANGLE BRACKET-->
    <char character="&#x27e9;" string="\rangle"/>
    <!--MATHEMATICAL LEFT DOUBLE ANGLE BRACKET, z notation left chevron bracket-->
    <char character="&#x27ea;" string="\lang"/>
    <!--MATHEMATICAL RIGHT DOUBLE ANGLE BRACKET, z notation right chevron bracket-->
    <char character="&#x27eb;" string="\rang"/>
    <!--MATHEMATICAL LEFT FLATTENED PARENTHESIS-->
    <char character="&#x27ee;" string="\lgroup"/>
    <!--MATHEMATICAL RIGHT FLATTENED PARENTHESIS-->
    <char character="&#x27ef;" string="\rgroup"/>
  
    <!-- *
          * Supplemental Arrows-A
          * -->
  
    <!--LONG LEFTWARDS ARROW-->
    <char character="&#x27f5;" string="\longleftarrow"/>
    <!--LONG RIGHTWARDS ARROW-->
    <char character="&#x27f6;" string="\longrightarrow"/>
    <!--LONG LEFT RIGHT ARROW-->
    <char character="&#x27f7;" string="\longleftrightarrow"/>
    <!--= \impliedby (amsmath), LONG LEFTWARDS DOUBLE ARROW-->
    <char character="&#x27f8;" string="\Longleftarrow"/>
    <!--= \implies (amsmath), LONG RIGHTWARDS DOUBLE ARROW-->
    <char character="&#x27f9;" string="\Longrightarrow"/>
    <!--= \iff (oz), LONG LEFT RIGHT DOUBLE ARROW-->
    <char character="&#x27fa;" string="\Longleftrightarrow"/>
    <!--= \longmappedfrom (kpfonts), LONG LEFTWARDS ARROW FROM BAR-->
    <char character="&#x27fb;" string="\longmapsfrom"/>
    <!--LONG RIGHTWARDS ARROW FROM BAR-->
    <char character="&#x27fc;" string="\longmapsto"/>
    <!--= \Longmappedfrom (kpfonts), LONG LEFTWARDS DOUBLE ARROW FROM BAR-->
    <char character="&#x27fd;" string="\Longmapsfrom"/>
    <!--LONG RIGHTWARDS DOUBLE ARROW FROM BAR-->
    <char character="&#x27fe;" string="\Longmapsto"/>
  
    <!-- *
          * Supplemental Arrows-B
          * -->
  
    <!--= \psurj (oz), RIGHTWARDS TWO-HEADED ARROW WITH VERTICAL STROKE, z notation partial surjection-->
    <char character="&#x2900;" string="\psur"/>
    <!--= \Mappedfrom (kpfonts), LEFTWARDS DOUBLE ARROW FROM BAR-->
    <char character="&#x2906;" string="\Mapsfrom"/>
    <!--RIGHTWARDS DOUBLE ARROW FROM BAR-->
    <char character="&#x2907;" string="\Mapsto"/>
    <!--UPWARDS ARROW TO BAR-->
    <char character="&#x2912;" string="\UpArrowBar"/>
    <!--DOWNWARDS ARROW TO BAR-->
    <char character="&#x2913;" string="\DownArrowBar"/>
    <!--RIGHTWARDS ARROW WITH TAIL WITH VERTICAL STROKE, z notation partial injection-->
    <char character="&#x2914;" string="\pinj"/>
    <!--RIGHTWARDS ARROW WITH TAIL WITH DOUBLE VERTICAL STROKE, z notation finite injection-->
    <char character="&#x2915;" string="\finj"/>
    <!--RIGHTWARDS TWO-HEADED ARROW WITH TAIL, z notation bijection-->
    <char character="&#x2916;" string="\bij"/>
    <!--WAVE ARROW POINTING DIRECTLY RIGHT-->
    <char character="&#x2933;" string="\leadsto"/>
    <!--LEFT BARB UP RIGHT BARB DOWN HARPOON-->
    <char character="&#x294a;" string="\leftrightharpoon"/>
    <!--LEFT BARB DOWN RIGHT BARB UP HARPOON-->
    <char character="&#x294b;" string="\rightleftharpoon"/>
    <!--LEFT BARB UP RIGHT BARB UP HARPOON-->
    <char character="&#x294e;" string="\leftrightharpoonup"/>
    <!--UP BARB RIGHT DOWN BARB RIGHT HARPOON-->
    <char character="&#x294f;" string="\rightupdownharpoon"/>
    <!--LEFT BARB DOWN RIGHT BARB DOWN HARPOON-->
    <char character="&#x2950;" string="\leftrightharpoondown"/>
    <!--UP BARB LEFT DOWN BARB LEFT HARPOON-->
    <char character="&#x2951;" string="\leftupdownharpoon"/>
    <!--LEFTWARDS HARPOON WITH BARB UP TO BAR-->
    <char character="&#x2952;" string="\LeftVectorBar"/>
    <!--RIGHTWARDS HARPOON WITH BARB UP TO BAR-->
    <char character="&#x2953;" string="\RightVectorBar"/>
    <!--UPWARDS HARPOON WITH BARB RIGHT TO BAR-->
    <char character="&#x2954;" string="\RightUpVectorBar"/>
    <!--DOWNWARDS HARPOON WITH BARB RIGHT TO BAR-->
    <char character="&#x2955;" string="\RightDownVectorBar"/>
    <!--LEFTWARDS HARPOON WITH BARB DOWN TO BAR-->
    <char character="&#x2956;" string="\DownLeftVectorBar"/>
    <!--RIGHTWARDS HARPOON WITH BARB DOWN TO BAR-->
    <char character="&#x2957;" string="\DownRightVectorBar"/>
    <!--UPWARDS HARPOON WITH BARB LEFT TO BAR-->
    <char character="&#x2958;" string="\LeftUpVectorBar"/>
    <!--DOWNWARDS HARPOON WITH BARB LEFT TO BAR-->
    <char character="&#x2959;" string="\LeftDownVectorBar"/>
    <!--LEFTWARDS HARPOON WITH BARB UP FROM BAR-->
    <char character="&#x295a;" string="\LeftTeeVector"/>
    <!--RIGHTWARDS HARPOON WITH BARB UP FROM BAR-->
    <char character="&#x295b;" string="\RightTeeVector"/>
    <!--UPWARDS HARPOON WITH BARB RIGHT FROM BAR-->
    <char character="&#x295c;" string="\RightUpTeeVector"/>
    <!--DOWNWARDS HARPOON WITH BARB RIGHT FROM BAR-->
    <char character="&#x295d;" string="\RightDownTeeVector"/>
    <!--LEFTWARDS HARPOON WITH BARB DOWN FROM BAR-->
    <char character="&#x295e;" string="\DownLeftTeeVector"/>
    <!--RIGHTWARDS HARPOON WITH BARB DOWN FROM BAR-->
    <char character="&#x295f;" string="\DownRightTeeVector"/>
    <!--UPWARDS HARPOON WITH BARB LEFT FROM BAR-->
    <char character="&#x2960;" string="\LeftUpTeeVector"/>
    <!--DOWNWARDS HARPOON WITH BARB LEFT FROM BAR-->
    <char character="&#x2961;" string="\LeftDownTeeVector"/>
    <!--LEFTWARDS HARPOON WITH BARB UP ABOVE LEFTWARDS HARPOON WITH BARB DOWN-->
    <char character="&#x2962;" string="\leftleftharpoons"/>
    <!--UPWARDS HARPOON WITH BARB LEFT BESIDE UPWARDS HARPOON WITH BARB RIGHT-->
    <char character="&#x2963;" string="\upupharpoons"/>
    <!--RIGHTWARDS HARPOON WITH BARB UP ABOVE RIGHTWARDS HARPOON WITH BARB DOWN-->
    <char character="&#x2964;" string="\rightrightharpoons"/>
    <!--DOWNWARDS HARPOON WITH BARB LEFT BESIDE DOWNWARDS HARPOON WITH BARB RIGHT-->
    <char character="&#x2965;" string="\downdownharpoons"/>
    <!--LEFTWARDS HARPOON WITH BARB UP ABOVE LONG DASH-->
    <char character="&#x296a;" string="\leftbarharpoon"/>
    <!--LEFTWARDS HARPOON WITH BARB DOWN BELOW LONG DASH-->
    <char character="&#x296b;" string="\barleftharpoon"/>
    <!--RIGHTWARDS HARPOON WITH BARB UP ABOVE LONG DASH-->
    <char character="&#x296c;" string="\rightbarharpoon"/>
    <!--RIGHTWARDS HARPOON WITH BARB DOWN BELOW LONG DASH-->
    <char character="&#x296d;" string="\barrightharpoon"/>
    <!--= \upequilibrium (wrisym), UPWARDS HARPOON WITH BARB LEFT BESIDE DOWNWARDS HARPOON WITH BARB RIGHT-->
    <char character="&#x296e;" string="\updownharpoons"/>
    <!--= \uprevequilibrium (wrisym), DOWNWARDS HARPOON WITH BARB LEFT BESIDE UPWARDS HARPOON WITH BARB RIGHT-->
    <char character="&#x296f;" string="\downupharpoons"/>
    <!--LEFT FISH TAIL-->
    <char character="&#x297c;" string="\strictfi"/>
    <!--RIGHT FISH TAIL-->
    <char character="&#x297d;" string="\strictif"/>
  
    <!-- *
          * Miscellaneous Mathematical Symbols-B
          * -->
  
    <!--TRIPLE VERTICAL BAR DELIMITER-->
    <char character="&#x2980;" string="\VERT"/>
    <!--= \dot (oz), Z NOTATION SPOT-->
    <char character="&#x2981;" string="\spot"/>
    <!--LEFT WHITE PARENTHESIS-->
    <char character="&#x2985;" string="\Lparen"/>
    <!--RIGHT WHITE PARENTHESIS-->
    <char character="&#x2986;" string="\Rparen"/>
    <!--= \llparenthesis (stmaryrd), Z NOTATION LEFT IMAGE BRACKET-->
    <char character="&#x2987;" string="\limg"/>
    <!--= \rrparenthesis (stmaryrd), Z NOTATION RIGHT IMAGE BRACKET-->
    <char character="&#x2988;" string="\rimg"/>
    <!--Z NOTATION LEFT BINDING BRACKET-->
    <char character="&#x2989;" string="\lblot"/>
    <!--Z NOTATION RIGHT BINDING BRACKET-->
    <char character="&#x298a;" string="\rblot"/>
    <!--CIRCLED REVERSE SOLIDUS-->
    <char character="&#x29b8;" string="\circledbslash"/>
    <!--CIRCLED LESS-THAN-->
    <char character="&#x29c0;" string="\circledless"/>
    <!--CIRCLED GREATER-THAN-->
    <char character="&#x29c1;" string="\circledgtr"/>
    <!--SQUARED RISING DIAGONAL SLASH-->
    <char character="&#x29c4;" string="\boxslash"/>
    <!--SQUARED FALLING DIAGONAL SLASH-->
    <char character="&#x29c5;" string="\boxbslash"/>
    <!--SQUARED ASTERISK-->
    <char character="&#x29c6;" string="\boxast"/>
    <!--SQUARED SMALL CIRCLE-->
    <char character="&#x29c7;" string="\boxcircle"/>
    <!--SQUARED SQUARE-->
    <char character="&#x29c8;" string="\boxbox"/>
    <!--LEFT TRIANGLE BESIDE VERTICAL BAR-->
    <char character="&#x29cf;" string="\LeftTriangleBar"/>
    <!--VERTICAL BAR BESIDE RIGHT TRIANGLE-->
    <char character="&#x29d0;" string="\RightTriangleBar"/>
    <!--DOUBLE-ENDED MULTIMAP-->
    <char character="&#x29df;" string="\multimapboth"/>
    <!--BLACK LOZENGE-->
    <char character="&#x29eb;" string="\blacklozenge"/>
    <!--REVERSE SOLIDUS OPERATOR-->
    <char character="&#x29f5;" string="\setminus"/>
    <!--= \hide (oz), BIG REVERSE SOLIDUS, z notation schema hiding-->
    <char character="&#x29f9;" string="\zhide"/>
  
    <!-- *
          * Supplemental Mathematical Operators
          * -->
  
    <!--N-ARY CIRCLED DOT OPERATOR-->
    <char character="&#x2a00;" string="\bigodot"/>
    <!--N-ARY CIRCLED PLUS OPERATOR-->
    <char character="&#x2a01;" string="\bigoplus"/>
    <!--N-ARY CIRCLED TIMES OPERATOR-->
    <char character="&#x2a02;" string="\bigotimes"/>
    <!--N-ARY UNION OPERATOR WITH PLUS-->
    <char character="&#x2a04;" string="\biguplus"/>
    <!--N-ARY SQUARE INTERSECTION OPERATOR-->
    <char character="&#x2a05;" string="\bigsqcap"/>
    <!--N-ARY SQUARE UNION OPERATOR-->
    <char character="&#x2a06;" string="\bigsqcup"/>
    <!--N-ARY TIMES OPERATOR-->
    <char character="&#x2a09;" string="\varprod"/>
    <!--QUADRUPLE INTEGRAL OPERATOR-->
    <char character="&#x2a0c;" string="\iiiint"/>
    <!--INTEGRAL AVERAGE WITH SLASH-->
    <char character="&#x2a0f;" string="\fint"/>
    <!--= \sqrint (wrisym), QUATERNION INTEGRAL OPERATOR-->
    <char character="&#x2a16;" string="\sqint"/>
    <!--JOIN-->
    <char character="&#x2a1d;" string="\Join"/>
    <!--= \semi (oz), = \fatsemi (stmaryrd), Z NOTATION SCHEMA COMPOSITION-->
    <char character="&#x2a1f;" string="\zcmp"/>
    <!--Z NOTATION SCHEMA PIPING-->
    <char character="&#x2a20;" string="\zpipe"/>
    <!--= \project (oz), Z NOTATION SCHEMA PROJECTION-->
    <char character="&#x2a21;" string="\zproject"/>
    <!--= \comp (oz), Z NOTATION RELATIONAL COMPOSITION-->
    <char character="&#x2a3e;" string="\fcmp"/>
    <!--AMALGAMATION OR COPRODUCT-->
    <char character="&#x2a3f;" string="\amalg"/>
    <!--LOGICAL AND WITH DOUBLE OVERBAR-->
    <char character="&#x2a5e;" string="\doublebarwedge"/>
    <!--= \ndres (oz), Z NOTATION DOMAIN ANTIRESTRICTION-->
    <char character="&#x2a64;" string="\dsub"/>
    <!--= \nrres (oz), Z NOTATION RANGE ANTIRESTRICTION-->
    <char character="&#x2a65;" string="\rsub"/>
    <!--# ::=, x \Coloneq (txfonts), DOUBLE COLON EQUAL-->
    <char character="&#x2a74;" string="\Coloneqq"/>
    <!--# ==, TWO CONSECUTIVE EQUALS SIGNS-->
    <char character="&#x2a75;" string="\Equal"/>
    <!--# ===, THREE CONSECUTIVE EQUALS SIGNS-->
    <char character="&#x2a76;" string="\Same"/>
    <!--LESS-THAN OR SLANTED EQUAL TO-->
    <char character="&#x2a7d;" string="\leqslant"/>
    <!--GREATER-THAN OR SLANTED EQUAL TO-->
    <char character="&#x2a7e;" string="\geqslant"/>
    <!--LESS-THAN OR APPROXIMATE-->
    <char character="&#x2a85;" string="\lessapprox"/>
    <!--GREATER-THAN OR APPROXIMATE-->
    <char character="&#x2a86;" string="\gtrapprox"/>
    <!--LESS-THAN AND SINGLE-LINE NOT EQUAL TO-->
    <char character="&#x2a87;" string="\lneq"/>
    <!--GREATER-THAN AND SINGLE-LINE NOT EQUAL TO-->
    <char character="&#x2a88;" string="\gneq"/>
    <!--LESS-THAN AND NOT APPROXIMATE-->
    <char character="&#x2a89;" string="\lnapprox"/>
    <!--GREATER-THAN AND NOT APPROXIMATE-->
    <char character="&#x2a8a;" string="\gnapprox"/>
    <!--LESS-THAN ABOVE DOUBLE-LINE EQUAL ABOVE GREATER-THAN-->
    <char character="&#x2a8b;" string="\lesseqqgtr"/>
    <!--GREATER-THAN ABOVE DOUBLE-LINE EQUAL ABOVE LESS-THAN-->
    <char character="&#x2a8c;" string="\gtreqqless"/>
    <!--SLANTED EQUAL TO OR LESS-THAN-->
    <char character="&#x2a95;" string="\eqslantless"/>
    <!--SLANTED EQUAL TO OR GREATER-THAN-->
    <char character="&#x2a96;" string="\eqslantgtr"/>
    <!--= \lll (mathabx -amssymb), DOUBLE NESTED LESS-THAN-->
    <char character="&#x2aa1;" string="\NestedLessLess"/>
    <!--= \ggg (mathabx -amssymb), DOUBLE NESTED GREATER-THAN-->
    <char character="&#x2aa2;" string="\NestedGreaterGreater"/>
    <!--LESS-THAN CLOSED BY CURVE-->
    <char character="&#x2aa6;" string="\leftslice"/>
    <!--GREATER-THAN CLOSED BY CURVE-->
    <char character="&#x2aa7;" string="\rightslice"/>
    <!--PRECEDES ABOVE SINGLE-LINE EQUALS SIGN-->
    <char character="&#x2aaf;" string="\preceq"/>
    <!--SUCCEEDS ABOVE SINGLE-LINE EQUALS SIGN-->
    <char character="&#x2ab0;" string="\succeq"/>
    <!--PRECEDES ABOVE EQUALS SIGN-->
    <char character="&#x2ab3;" string="\preceqq"/>
    <!--SUCCEEDS ABOVE EQUALS SIGN-->
    <char character="&#x2ab4;" string="\succeqq"/>
    <!--PRECEDES ABOVE ALMOST EQUAL TO-->
    <char character="&#x2ab7;" string="\precapprox"/>
    <!--SUCCEEDS ABOVE ALMOST EQUAL TO-->
    <char character="&#x2ab8;" string="\succapprox"/>
    <!--PRECEDES ABOVE NOT ALMOST EQUAL TO-->
    <char character="&#x2ab9;" string="\precnapprox"/>
    <!--SUCCEEDS ABOVE NOT ALMOST EQUAL TO-->
    <char character="&#x2aba;" string="\succnapprox"/>
    <!--DOUBLE PRECEDES-->
    <char character="&#x2abb;" string="\llcurly"/>
    <!--DOUBLE SUCCEEDS-->
    <char character="&#x2abc;" string="\ggcurly"/>
    <!--SUBSET OF ABOVE EQUALS SIGN-->
    <char character="&#x2ac5;" string="\subseteqq"/>
    <!--SUPERSET OF ABOVE EQUALS SIGN-->
    <char character="&#x2ac6;" string="\supseteqq"/>
    <!--SUBSET OF ABOVE NOT EQUAL TO-->
    <char character="&#x2acb;" string="\subsetneqq"/>
    <!--SUPERSET OF ABOVE NOT EQUAL TO-->
    <char character="&#x2acc;" string="\supsetneqq"/>
    <!--DOUBLE DOWN TACK-->
    <char character="&#x2aea;" string="\Top"/>
    <!--= \Perp (txfonts), DOUBLE UP TACK-->
    <char character="&#x2aeb;" string="\Bot"/>
    <!--TRIPLE VERTICAL BAR BINARY RELATION-->
    <char character="&#x2af4;" string="\interleave"/>
    <!--LARGE TRIPLE VERTICAL BAR OPERATOR-->
    <char character="&#x2afc;" string="\biginterleave"/>
    <!--# \varparallel (txfonts), DOUBLE SOLIDUS OPERATOR-->
    <char character="&#x2afd;" string="\sslash"/>
    <!--WHITE VERTICAL BAR-->
    <char character="&#x2afe;" string="\talloblong"/>
  
    <!-- *
         * Miscellaneous Symbols and Arrows
         * -->
  
    <!--BLACK LARGE SQUARE-->
    <char character="&#x2b1b;" string="\blacksquare"/>
    <!--WHITE LARGE SQUARE-->
    <char character="&#x2b1c;" string="\square"/>
    <!-- BLACK VERY SMALL SQUARE -->
    <char character="&#x2b1d;" string="\blacksquare"/>
    <!-- BLACK MEDIUM LOZENGE -->
    <char character="&#x2b27;" string="\blacklozenge"/>
    <!-- WHITE MEDIUM LOZENGE -->
    <char character="&#x2b28;" string="\lozenge"/>
    

    <!-- *
         * CJK Symbols and Punctuation
         * -->
  
  
  
    <!-- *
         * Hiragana
         * -->
  
  
  
    <!-- *
         * Alphabetic Presentation Forms
         * -->
  
  
  
    <!-- *
         * Variation Selectors
         * -->
  
  
  
    <!-- *
         * Small Form Variants
         * -->
  
  
  
    <!-- *
         * Halfwidth and Fullwidth Forms
         * -->
  
  
  
    <!-- *
         * Mathematical Alphanumeric Symbols
         * -->
  
    <!--MATHEMATICAL BOLD CAPITAL A-->
    <char character="&#x1d400;" string="\mathbf{A}"/>
    <!--MATHEMATICAL BOLD CAPITAL B-->
    <char character="&#x1d401;" string="\mathbf{B}"/>
    <!--MATHEMATICAL BOLD CAPITAL C-->
    <char character="&#x1d402;" string="\mathbf{C}"/>
    <!--MATHEMATICAL BOLD CAPITAL D-->
    <char character="&#x1d403;" string="\mathbf{D}"/>
    <!--MATHEMATICAL BOLD CAPITAL E-->
    <char character="&#x1d404;" string="\mathbf{E}"/>
    <!--MATHEMATICAL BOLD CAPITAL F-->
    <char character="&#x1d405;" string="\mathbf{F}"/>
    <!--MATHEMATICAL BOLD CAPITAL G-->
    <char character="&#x1d406;" string="\mathbf{G}"/>
    <!--MATHEMATICAL BOLD CAPITAL H-->
    <char character="&#x1d407;" string="\mathbf{H}"/>
    <!--MATHEMATICAL BOLD CAPITAL I-->
    <char character="&#x1d408;" string="\mathbf{I}"/>
    <!--MATHEMATICAL BOLD CAPITAL J-->
    <char character="&#x1d409;" string="\mathbf{J}"/>
    <!--MATHEMATICAL BOLD CAPITAL K-->
    <char character="&#x1d40a;" string="\mathbf{K}"/>
    <!--MATHEMATICAL BOLD CAPITAL L-->
    <char character="&#x1d40b;" string="\mathbf{L}"/>
    <!--MATHEMATICAL BOLD CAPITAL M-->
    <char character="&#x1d40c;" string="\mathbf{M}"/>
    <!--MATHEMATICAL BOLD CAPITAL N-->
    <char character="&#x1d40d;" string="\mathbf{N}"/>
    <!--MATHEMATICAL BOLD CAPITAL O-->
    <char character="&#x1d40e;" string="\mathbf{O}"/>
    <!--MATHEMATICAL BOLD CAPITAL P-->
    <char character="&#x1d40f;" string="\mathbf{P}"/>
    <!--MATHEMATICAL BOLD CAPITAL Q-->
    <char character="&#x1d410;" string="\mathbf{Q}"/>
    <!--MATHEMATICAL BOLD CAPITAL R-->
    <char character="&#x1d411;" string="\mathbf{R}"/>
    <!--MATHEMATICAL BOLD CAPITAL S-->
    <char character="&#x1d412;" string="\mathbf{S}"/>
    <!--MATHEMATICAL BOLD CAPITAL T-->
    <char character="&#x1d413;" string="\mathbf{T}"/>
    <!--MATHEMATICAL BOLD CAPITAL U-->
    <char character="&#x1d414;" string="\mathbf{U}"/>
    <!--MATHEMATICAL BOLD CAPITAL V-->
    <char character="&#x1d415;" string="\mathbf{V}"/>
    <!--MATHEMATICAL BOLD CAPITAL W-->
    <char character="&#x1d416;" string="\mathbf{W}"/>
    <!--MATHEMATICAL BOLD CAPITAL X-->
    <char character="&#x1d417;" string="\mathbf{X}"/>
    <!--MATHEMATICAL BOLD CAPITAL Y-->
    <char character="&#x1d418;" string="\mathbf{Y}"/>
    <!--MATHEMATICAL BOLD CAPITAL Z-->
    <char character="&#x1d419;" string="\mathbf{Z}"/>
    <!--MATHEMATICAL BOLD SMALL A-->
    <char character="&#x1d41a;" string="\mathbf{a}"/>
    <!--MATHEMATICAL BOLD SMALL B-->
    <char character="&#x1d41b;" string="\mathbf{b}"/>
    <!--MATHEMATICAL BOLD SMALL C-->
    <char character="&#x1d41c;" string="\mathbf{c}"/>
    <!--MATHEMATICAL BOLD SMALL D-->
    <char character="&#x1d41d;" string="\mathbf{d}"/>
    <!--MATHEMATICAL BOLD SMALL E-->
    <char character="&#x1d41e;" string="\mathbf{e}"/>
    <!--MATHEMATICAL BOLD SMALL F-->
    <char character="&#x1d41f;" string="\mathbf{f}"/>
    <!--MATHEMATICAL BOLD SMALL G-->
    <char character="&#x1d420;" string="\mathbf{g}"/>
    <!--MATHEMATICAL BOLD SMALL H-->
    <char character="&#x1d421;" string="\mathbf{h}"/>
    <!--MATHEMATICAL BOLD SMALL I-->
    <char character="&#x1d422;" string="\mathbf{i}"/>
    <!--MATHEMATICAL BOLD SMALL J-->
    <char character="&#x1d423;" string="\mathbf{j}"/>
    <!--MATHEMATICAL BOLD SMALL K-->
    <char character="&#x1d424;" string="\mathbf{k}"/>
    <!--MATHEMATICAL BOLD SMALL L-->
    <char character="&#x1d425;" string="\mathbf{l}"/>
    <!--MATHEMATICAL BOLD SMALL M-->
    <char character="&#x1d426;" string="\mathbf{m}"/>
    <!--MATHEMATICAL BOLD SMALL N-->
    <char character="&#x1d427;" string="\mathbf{n}"/>
    <!--MATHEMATICAL BOLD SMALL O-->
    <char character="&#x1d428;" string="\mathbf{o}"/>
    <!--MATHEMATICAL BOLD SMALL P-->
    <char character="&#x1d429;" string="\mathbf{p}"/>
    <!--MATHEMATICAL BOLD SMALL Q-->
    <char character="&#x1d42a;" string="\mathbf{q}"/>
    <!--MATHEMATICAL BOLD SMALL R-->
    <char character="&#x1d42b;" string="\mathbf{r}"/>
    <!--MATHEMATICAL BOLD SMALL S-->
    <char character="&#x1d42c;" string="\mathbf{s}"/>
    <!--MATHEMATICAL BOLD SMALL T-->
    <char character="&#x1d42d;" string="\mathbf{t}"/>
    <!--MATHEMATICAL BOLD SMALL U-->
    <char character="&#x1d42e;" string="\mathbf{u}"/>
    <!--MATHEMATICAL BOLD SMALL V-->
    <char character="&#x1d42f;" string="\mathbf{v}"/>
    <!--MATHEMATICAL BOLD SMALL W-->
    <char character="&#x1d430;" string="\mathbf{w}"/>
    <!--MATHEMATICAL BOLD SMALL X-->
    <char character="&#x1d431;" string="\mathbf{x}"/>
    <!--MATHEMATICAL BOLD SMALL Y-->
    <char character="&#x1d432;" string="\mathbf{y}"/>
    <!--MATHEMATICAL BOLD SMALL Z-->
    <char character="&#x1d433;" string="\mathbf{z}"/>
    <!--= \mathit{A}, MATHEMATICAL ITALIC CAPITAL A-->
    <char character="&#x1d434;" string="A"/>
    <!--= \mathit{B}, MATHEMATICAL ITALIC CAPITAL B-->
    <char character="&#x1d435;" string="B"/>
    <!--= \mathit{C}, MATHEMATICAL ITALIC CAPITAL C-->
    <char character="&#x1d436;" string="C"/>
    <!--= \mathit{D}, MATHEMATICAL ITALIC CAPITAL D-->
    <char character="&#x1d437;" string="D"/>
    <!--= \mathit{E}, MATHEMATICAL ITALIC CAPITAL E-->
    <char character="&#x1d438;" string="E"/>
    <!--= \mathit{F}, MATHEMATICAL ITALIC CAPITAL F-->
    <char character="&#x1d439;" string="F"/>
    <!--= \mathit{G}, MATHEMATICAL ITALIC CAPITAL G-->
    <char character="&#x1d43a;" string="G"/>
    <!--= \mathit{H}, MATHEMATICAL ITALIC CAPITAL H-->
    <char character="&#x1d43b;" string="H"/>
    <!--= \mathit{I}, MATHEMATICAL ITALIC CAPITAL I-->
    <char character="&#x1d43c;" string="I"/>
    <!--= \mathit{J}, MATHEMATICAL ITALIC CAPITAL J-->
    <char character="&#x1d43d;" string="J"/>
    <!--= \mathit{K}, MATHEMATICAL ITALIC CAPITAL K-->
    <char character="&#x1d43e;" string="K"/>
    <!--= \mathit{L}, MATHEMATICAL ITALIC CAPITAL L-->
    <char character="&#x1d43f;" string="L"/>
    <!--= \mathit{M}, MATHEMATICAL ITALIC CAPITAL M-->
    <char character="&#x1d440;" string="M"/>
    <!--= \mathit{N}, MATHEMATICAL ITALIC CAPITAL N-->
    <char character="&#x1d441;" string="N"/>
    <!--= \mathit{O}, MATHEMATICAL ITALIC CAPITAL O-->
    <char character="&#x1d442;" string="O"/>
    <!--= \mathit{P}, MATHEMATICAL ITALIC CAPITAL P-->
    <char character="&#x1d443;" string="P"/>
    <!--= \mathit{Q}, MATHEMATICAL ITALIC CAPITAL Q-->
    <char character="&#x1d444;" string="Q"/>
    <!--= \mathit{R}, MATHEMATICAL ITALIC CAPITAL R-->
    <char character="&#x1d445;" string="R"/>
    <!--= \mathit{S}, MATHEMATICAL ITALIC CAPITAL S-->
    <char character="&#x1d446;" string="S"/>
    <!--= \mathit{T}, MATHEMATICAL ITALIC CAPITAL T-->
    <char character="&#x1d447;" string="T"/>
    <!--= \mathit{U}, MATHEMATICAL ITALIC CAPITAL U-->
    <char character="&#x1d448;" string="U"/>
    <!--= \mathit{V}, MATHEMATICAL ITALIC CAPITAL V-->
    <char character="&#x1d449;" string="V"/>
    <!--= \mathit{W}, MATHEMATICAL ITALIC CAPITAL W-->
    <char character="&#x1d44a;" string="W"/>
    <!--= \mathit{X}, MATHEMATICAL ITALIC CAPITAL X-->
    <char character="&#x1d44b;" string="X"/>
    <!--= \mathit{Y}, MATHEMATICAL ITALIC CAPITAL Y-->
    <char character="&#x1d44c;" string="Y"/>
    <!--= \mathit{Z}, MATHEMATICAL ITALIC CAPITAL Z-->
    <char character="&#x1d44d;" string="Z"/>
    <!--= \mathit{a}, MATHEMATICAL ITALIC SMALL A-->
    <char character="&#x1d44e;" string="a"/>
    <!--= \mathit{b}, MATHEMATICAL ITALIC SMALL B-->
    <char character="&#x1d44f;" string="b"/>
    <!--= \mathit{c}, MATHEMATICAL ITALIC SMALL C-->
    <char character="&#x1d450;" string="c"/>
    <!--= \mathit{d}, MATHEMATICAL ITALIC SMALL D-->
    <char character="&#x1d451;" string="d"/>
    <!--= \mathit{e}, MATHEMATICAL ITALIC SMALL E-->
    <char character="&#x1d452;" string="e"/>
    <!--= \mathit{f}, MATHEMATICAL ITALIC SMALL F-->
    <char character="&#x1d453;" string="f"/>
    <!--= \mathit{g}, MATHEMATICAL ITALIC SMALL G-->
    <char character="&#x1d454;" string="g"/>
    <!--= \mathit{i}, MATHEMATICAL ITALIC SMALL I-->
    <char character="&#x1d456;" string="i"/>
    <!--= \mathit{j}, MATHEMATICAL ITALIC SMALL J-->
    <char character="&#x1d457;" string="j"/>
    <!--= \mathit{k}, MATHEMATICAL ITALIC SMALL K-->
    <char character="&#x1d458;" string="k"/>
    <!--= \mathit{l}, MATHEMATICAL ITALIC SMALL L-->
    <char character="&#x1d459;" string="l"/>
    <!--= \mathit{m}, MATHEMATICAL ITALIC SMALL M-->
    <char character="&#x1d45a;" string="m"/>
    <!--= \mathit{n}, MATHEMATICAL ITALIC SMALL N-->
    <char character="&#x1d45b;" string="n"/>
    <!--= \mathit{o}, MATHEMATICAL ITALIC SMALL O-->
    <char character="&#x1d45c;" string="o"/>
    <!--= \mathit{p}, MATHEMATICAL ITALIC SMALL P-->
    <char character="&#x1d45d;" string="p"/>
    <!--= \mathit{q}, MATHEMATICAL ITALIC SMALL Q-->
    <char character="&#x1d45e;" string="q"/>
    <!--= \mathit{r}, MATHEMATICAL ITALIC SMALL R-->
    <char character="&#x1d45f;" string="r"/>
    <!--= \mathit{s}, MATHEMATICAL ITALIC SMALL S-->
    <char character="&#x1d460;" string="s"/>
    <!--= \mathit{t}, MATHEMATICAL ITALIC SMALL T-->
    <char character="&#x1d461;" string="t"/>
    <!--= \mathit{u}, MATHEMATICAL ITALIC SMALL U-->
    <char character="&#x1d462;" string="u"/>
    <!--= \mathit{v}, MATHEMATICAL ITALIC SMALL V-->
    <char character="&#x1d463;" string="v"/>
    <!--= \mathit{w}, MATHEMATICAL ITALIC SMALL W-->
    <char character="&#x1d464;" string="w"/>
    <!--= \mathit{x}, MATHEMATICAL ITALIC SMALL X-->
    <char character="&#x1d465;" string="x"/>
    <!--= \mathit{y}, MATHEMATICAL ITALIC SMALL Y-->
    <char character="&#x1d466;" string="y"/>
    <!--= \mathit{z}, MATHEMATICAL ITALIC SMALL Z-->
    <char character="&#x1d467;" string="z"/>
    <!--= \mathbold{A} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL A-->
    <char character="&#x1d468;" string="\mathbfit{A}"/>
    <!--= \mathbold{B} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL B-->
    <char character="&#x1d469;" string="\mathbfit{B}"/>
    <!--= \mathbold{C} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL C-->
    <char character="&#x1d46a;" string="\mathbfit{C}"/>
    <!--= \mathbold{D} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL D-->
    <char character="&#x1d46b;" string="\mathbfit{D}"/>
    <!--= \mathbold{E} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL E-->
    <char character="&#x1d46c;" string="\mathbfit{E}"/>
    <!--= \mathbold{F} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL F-->
    <char character="&#x1d46d;" string="\mathbfit{F}"/>
    <!--= \mathbold{G} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL G-->
    <char character="&#x1d46e;" string="\mathbfit{G}"/>
    <!--= \mathbold{H} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL H-->
    <char character="&#x1d46f;" string="\mathbfit{H}"/>
    <!--= \mathbold{I} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL I-->
    <char character="&#x1d470;" string="\mathbfit{I}"/>
    <!--= \mathbold{J} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL J-->
    <char character="&#x1d471;" string="\mathbfit{J}"/>
    <!--= \mathbold{K} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL K-->
    <char character="&#x1d472;" string="\mathbfit{K}"/>
    <!--= \mathbold{L} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL L-->
    <char character="&#x1d473;" string="\mathbfit{L}"/>
    <!--= \mathbold{M} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL M-->
    <char character="&#x1d474;" string="\mathbfit{M}"/>
    <!--= \mathbold{N} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL N-->
    <char character="&#x1d475;" string="\mathbfit{N}"/>
    <!--= \mathbold{O} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL O-->
    <char character="&#x1d476;" string="\mathbfit{O}"/>
    <!--= \mathbold{P} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL P-->
    <char character="&#x1d477;" string="\mathbfit{P}"/>
    <!--= \mathbold{Q} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL Q-->
    <char character="&#x1d478;" string="\mathbfit{Q}"/>
    <!--= \mathbold{R} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL R-->
    <char character="&#x1d479;" string="\mathbfit{R}"/>
    <!--= \mathbold{S} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL S-->
    <char character="&#x1d47a;" string="\mathbfit{S}"/>
    <!--= \mathbold{T} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL T-->
    <char character="&#x1d47b;" string="\mathbfit{T}"/>
    <!--= \mathbold{U} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL U-->
    <char character="&#x1d47c;" string="\mathbfit{U}"/>
    <!--= \mathbold{V} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL V-->
    <char character="&#x1d47d;" string="\mathbfit{V}"/>
    <!--= \mathbold{W} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL W-->
    <char character="&#x1d47e;" string="\mathbfit{W}"/>
    <!--= \mathbold{X} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL X-->
    <char character="&#x1d47f;" string="\mathbfit{X}"/>
    <!--= \mathbold{Y} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL Y-->
    <char character="&#x1d480;" string="\mathbfit{Y}"/>
    <!--= \mathbold{Z} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL Z-->
    <char character="&#x1d481;" string="\mathbfit{Z}"/>
    <!--= \mathbold{a} (fixmath), MATHEMATICAL BOLD ITALIC SMALL A-->
    <char character="&#x1d482;" string="\mathbfit{a}"/>
    <!--= \mathbold{b} (fixmath), MATHEMATICAL BOLD ITALIC SMALL B-->
    <char character="&#x1d483;" string="\mathbfit{b}"/>
    <!--= \mathbold{c} (fixmath), MATHEMATICAL BOLD ITALIC SMALL C-->
    <char character="&#x1d484;" string="\mathbfit{c}"/>
    <!--= \mathbold{d} (fixmath), MATHEMATICAL BOLD ITALIC SMALL D-->
    <char character="&#x1d485;" string="\mathbfit{d}"/>
    <!--= \mathbold{e} (fixmath), MATHEMATICAL BOLD ITALIC SMALL E-->
    <char character="&#x1d486;" string="\mathbfit{e}"/>
    <!--= \mathbold{f} (fixmath), MATHEMATICAL BOLD ITALIC SMALL F-->
    <char character="&#x1d487;" string="\mathbfit{f}"/>
    <!--= \mathbold{g} (fixmath), MATHEMATICAL BOLD ITALIC SMALL G-->
    <char character="&#x1d488;" string="\mathbfit{g}"/>
    <!--= \mathbold{h} (fixmath), MATHEMATICAL BOLD ITALIC SMALL H-->
    <char character="&#x1d489;" string="\mathbfit{h}"/>
    <!--= \mathbold{i} (fixmath), MATHEMATICAL BOLD ITALIC SMALL I-->
    <char character="&#x1d48a;" string="\mathbfit{i}"/>
    <!--= \mathbold{j} (fixmath), MATHEMATICAL BOLD ITALIC SMALL J-->
    <char character="&#x1d48b;" string="\mathbfit{j}"/>
    <!--= \mathbold{k} (fixmath), MATHEMATICAL BOLD ITALIC SMALL K-->
    <char character="&#x1d48c;" string="\mathbfit{k}"/>
    <!--= \mathbold{l} (fixmath), MATHEMATICAL BOLD ITALIC SMALL L-->
    <char character="&#x1d48d;" string="\mathbfit{l}"/>
    <!--= \mathbold{m} (fixmath), MATHEMATICAL BOLD ITALIC SMALL M-->
    <char character="&#x1d48e;" string="\mathbfit{m}"/>
    <!--= \mathbold{n} (fixmath), MATHEMATICAL BOLD ITALIC SMALL N-->
    <char character="&#x1d48f;" string="\mathbfit{n}"/>
    <!--= \mathbold{o} (fixmath), MATHEMATICAL BOLD ITALIC SMALL O-->
    <char character="&#x1d490;" string="\mathbfit{o}"/>
    <!--= \mathbold{p} (fixmath), MATHEMATICAL BOLD ITALIC SMALL P-->
    <char character="&#x1d491;" string="\mathbfit{p}"/>
    <!--= \mathbold{q} (fixmath), MATHEMATICAL BOLD ITALIC SMALL Q-->
    <char character="&#x1d492;" string="\mathbfit{q}"/>
    <!--= \mathbold{r} (fixmath), MATHEMATICAL BOLD ITALIC SMALL R-->
    <char character="&#x1d493;" string="\mathbfit{r}"/>
    <!--= \mathbold{s} (fixmath), MATHEMATICAL BOLD ITALIC SMALL S-->
    <char character="&#x1d494;" string="\mathbfit{s}"/>
    <!--= \mathbold{t} (fixmath), MATHEMATICAL BOLD ITALIC SMALL T-->
    <char character="&#x1d495;" string="\mathbfit{t}"/>
    <!--= \mathbold{u} (fixmath), MATHEMATICAL BOLD ITALIC SMALL U-->
    <char character="&#x1d496;" string="\mathbfit{u}"/>
    <!--= \mathbold{v} (fixmath), MATHEMATICAL BOLD ITALIC SMALL V-->
    <char character="&#x1d497;" string="\mathbfit{v}"/>
    <!--= \mathbold{w} (fixmath), MATHEMATICAL BOLD ITALIC SMALL W-->
    <char character="&#x1d498;" string="\mathbfit{w}"/>
    <!--= \mathbold{x} (fixmath), MATHEMATICAL BOLD ITALIC SMALL X-->
    <char character="&#x1d499;" string="\mathbfit{x}"/>
    <!--= \mathbold{y} (fixmath), MATHEMATICAL BOLD ITALIC SMALL Y-->
    <char character="&#x1d49a;" string="\mathbfit{y}"/>
    <!--= \mathbold{z} (fixmath), MATHEMATICAL BOLD ITALIC SMALL Z-->
    <char character="&#x1d49b;" string="\mathbfit{z}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL A-->
    <char character="&#x1d49c;" string="\mathcal{A}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL C-->
    <char character="&#x1d49e;" string="\mathcal{C}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL D-->
    <char character="&#x1d49f;" string="\mathcal{D}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL G-->
    <char character="&#x1d4a2;" string="\mathcal{G}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL J-->
    <char character="&#x1d4a5;" string="\mathcal{J}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL K-->
    <char character="&#x1d4a6;" string="\mathcal{K}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL N-->
    <char character="&#x1d4a9;" string="\mathcal{N}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL O-->
    <char character="&#x1d4aa;" string="\mathcal{O}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL P-->
    <char character="&#x1d4ab;" string="\mathcal{P}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL Q-->
    <char character="&#x1d4ac;" string="\mathcal{Q}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL S-->
    <char character="&#x1d4ae;" string="\mathcal{S}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL T-->
    <char character="&#x1d4af;" string="\mathcal{T}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL U-->
    <char character="&#x1d4b0;" string="\mathcal{U}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL V-->
    <char character="&#x1d4b1;" string="\mathcal{V}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL W-->
    <char character="&#x1d4b2;" string="\mathcal{W}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL X-->
    <char character="&#x1d4b3;" string="\mathcal{X}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL Y-->
    <char character="&#x1d4b4;" string="\mathcal{Y}"/>
    <!--MATHEMATICAL SCRIPT CAPITAL Z-->
    <char character="&#x1d4b5;" string="\mathcal{Z}"/>
    <!--MATHEMATICAL SCRIPT SMALL A-->
    <char character="&#x1d4b6;" string="\mathcal{a}"/>
    <!--MATHEMATICAL SCRIPT SMALL B-->
    <char character="&#x1d4b7;" string="\mathcal{b}"/>
    <!--MATHEMATICAL SCRIPT SMALL C-->
    <char character="&#x1d4b8;" string="\mathcal{c}"/>
    <!--MATHEMATICAL SCRIPT SMALL D-->
    <char character="&#x1d4b9;" string="\mathcal{d}"/>
    <!--MATHEMATICAL SCRIPT SMALL F-->
    <char character="&#x1d4bb;" string="\mathcal{f}"/>
    <!--MATHEMATICAL SCRIPT SMALL H-->
    <char character="&#x1d4bd;" string="\mathcal{h}"/>
    <!--MATHEMATICAL SCRIPT SMALL I-->
    <char character="&#x1d4be;" string="\mathcal{i}"/>
    <!--MATHEMATICAL SCRIPT SMALL J-->
    <char character="&#x1d4bf;" string="\mathcal{j}"/>
    <!--MATHEMATICAL SCRIPT SMALL K-->
    <char character="&#x1d4c0;" string="\mathcal{k}"/>
    <!--MATHEMATICAL SCRIPT SMALL L-->
    <char character="&#x1d4c1;" string="\mathcal{l}"/>
    <!--MATHEMATICAL SCRIPT SMALL M-->
    <char character="&#x1d4c2;" string="\mathcal{m}"/>
    <!--MATHEMATICAL SCRIPT SMALL N-->
    <char character="&#x1d4c3;" string="\mathcal{n}"/>
    <!--MATHEMATICAL SCRIPT SMALL P-->
    <char character="&#x1d4c5;" string="\mathcal{p}"/>
    <!--MATHEMATICAL SCRIPT SMALL Q-->
    <char character="&#x1d4c6;" string="\mathcal{q}"/>
    <!--MATHEMATICAL SCRIPT SMALL R-->
    <char character="&#x1d4c7;" string="\mathcal{r}"/>
    <!--MATHEMATICAL SCRIPT SMALL S-->
    <char character="&#x1d4c8;" string="\mathcal{s}"/>
    <!--MATHEMATICAL SCRIPT SMALL T-->
    <char character="&#x1d4c9;" string="\mathcal{t}"/>
    <!--MATHEMATICAL SCRIPT SMALL U-->
    <char character="&#x1d4ca;" string="\mathcal{u}"/>
    <!--MATHEMATICAL SCRIPT SMALL V-->
    <char character="&#x1d4cb;" string="\mathcal{v}"/>
    <!--MATHEMATICAL SCRIPT SMALL W-->
    <char character="&#x1d4cc;" string="\mathcal{w}"/>
    <!--MATHEMATICAL SCRIPT SMALL X-->
    <char character="&#x1d4cd;" string="\mathcal{x}"/>
    <!--MATHEMATICAL SCRIPT SMALL Y-->
    <char character="&#x1d4ce;" string="\mathcal{y}"/>
    <!--MATHEMATICAL SCRIPT SMALL Z-->
    <char character="&#x1d4cf;" string="\mathcal{z}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL A-->
    <char character="&#x1d504;" string="\mathfrak{A}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL B-->
    <char character="&#x1d505;" string="\mathfrak{B}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL D-->
    <char character="&#x1d507;" string="\mathfrak{D}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL E-->
    <char character="&#x1d508;" string="\mathfrak{E}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL F-->
    <char character="&#x1d509;" string="\mathfrak{F}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL G-->
    <char character="&#x1d50a;" string="\mathfrak{G}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL J-->
    <char character="&#x1d50d;" string="\mathfrak{J}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL K-->
    <char character="&#x1d50e;" string="\mathfrak{K}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL L-->
    <char character="&#x1d50f;" string="\mathfrak{L}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL M-->
    <char character="&#x1d510;" string="\mathfrak{M}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL N-->
    <char character="&#x1d511;" string="\mathfrak{N}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL O-->
    <char character="&#x1d512;" string="\mathfrak{O}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL P-->
    <char character="&#x1d513;" string="\mathfrak{P}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL Q-->
    <char character="&#x1d514;" string="\mathfrak{Q}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL S-->
    <char character="&#x1d516;" string="\mathfrak{S}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL T-->
    <char character="&#x1d517;" string="\mathfrak{T}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL U-->
    <char character="&#x1d518;" string="\mathfrak{U}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL V-->
    <char character="&#x1d519;" string="\mathfrak{V}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL W-->
    <char character="&#x1d51a;" string="\mathfrak{W}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL X-->
    <char character="&#x1d51b;" string="\mathfrak{X}"/>
    <!--MATHEMATICAL FRAKTUR CAPITAL Y-->
    <char character="&#x1d51c;" string="\mathfrak{Y}"/>
    <!--MATHEMATICAL FRAKTUR SMALL A-->
    <char character="&#x1d51e;" string="\mathfrak{a}"/>
    <!--MATHEMATICAL FRAKTUR SMALL B-->
    <char character="&#x1d51f;" string="\mathfrak{b}"/>
    <!--MATHEMATICAL FRAKTUR SMALL C-->
    <char character="&#x1d520;" string="\mathfrak{c}"/>
    <!--MATHEMATICAL FRAKTUR SMALL D-->
    <char character="&#x1d521;" string="\mathfrak{d}"/>
    <!--MATHEMATICAL FRAKTUR SMALL E-->
    <char character="&#x1d522;" string="\mathfrak{e}"/>
    <!--MATHEMATICAL FRAKTUR SMALL F-->
    <char character="&#x1d523;" string="\mathfrak{f}"/>
    <!--MATHEMATICAL FRAKTUR SMALL G-->
    <char character="&#x1d524;" string="\mathfrak{g}"/>
    <!--MATHEMATICAL FRAKTUR SMALL H-->
    <char character="&#x1d525;" string="\mathfrak{h}"/>
    <!--MATHEMATICAL FRAKTUR SMALL I-->
    <char character="&#x1d526;" string="\mathfrak{i}"/>
    <!--MATHEMATICAL FRAKTUR SMALL J-->
    <char character="&#x1d527;" string="\mathfrak{j}"/>
    <!--MATHEMATICAL FRAKTUR SMALL K-->
    <char character="&#x1d528;" string="\mathfrak{k}"/>
    <!--MATHEMATICAL FRAKTUR SMALL L-->
    <char character="&#x1d529;" string="\mathfrak{l}"/>
    <!--MATHEMATICAL FRAKTUR SMALL M-->
    <char character="&#x1d52a;" string="\mathfrak{m}"/>
    <!--MATHEMATICAL FRAKTUR SMALL N-->
    <char character="&#x1d52b;" string="\mathfrak{n}"/>
    <!--MATHEMATICAL FRAKTUR SMALL O-->
    <char character="&#x1d52c;" string="\mathfrak{o}"/>
    <!--MATHEMATICAL FRAKTUR SMALL P-->
    <char character="&#x1d52d;" string="\mathfrak{p}"/>
    <!--MATHEMATICAL FRAKTUR SMALL Q-->
    <char character="&#x1d52e;" string="\mathfrak{q}"/>
    <!--MATHEMATICAL FRAKTUR SMALL R-->
    <char character="&#x1d52f;" string="\mathfrak{r}"/>
    <!--MATHEMATICAL FRAKTUR SMALL S-->
    <char character="&#x1d530;" string="\mathfrak{s}"/>
    <!--MATHEMATICAL FRAKTUR SMALL T-->
    <char character="&#x1d531;" string="\mathfrak{t}"/>
    <!--MATHEMATICAL FRAKTUR SMALL U-->
    <char character="&#x1d532;" string="\mathfrak{u}"/>
    <!--MATHEMATICAL FRAKTUR SMALL V-->
    <char character="&#x1d533;" string="\mathfrak{v}"/>
    <!--MATHEMATICAL FRAKTUR SMALL W-->
    <char character="&#x1d534;" string="\mathfrak{w}"/>
    <!--MATHEMATICAL FRAKTUR SMALL X-->
    <char character="&#x1d535;" string="\mathfrak{x}"/>
    <!--MATHEMATICAL FRAKTUR SMALL Y-->
    <char character="&#x1d536;" string="\mathfrak{y}"/>
    <!--MATHEMATICAL FRAKTUR SMALL Z-->
    <char character="&#x1d537;" string="\mathfrak{z}"/>
    <!--= \mathds{A} (dsfont), MATHEMATICAL DOUBLE-STRUCK CAPITAL A-->
    <char character="&#x1d538;" string="\mathbb{A}"/>
    <!--= \mathds{B} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL B-->
    <char character="&#x1d539;" string="\mathbb{B}"/>
    <!--= \mathds{D} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL D-->
    <char character="&#x1d53b;" string="\mathbb{D}"/>
    <!--= \mathds{E} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL E-->
    <char character="&#x1d53c;" string="\mathbb{E}"/>
    <!--= \mathds{F} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL F-->
    <char character="&#x1d53d;" string="\mathbb{F}"/>
    <!--= \mathds{G} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL G-->
    <char character="&#x1d53e;" string="\mathbb{G}"/>
    <!--= \mathds{I} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL I-->
    <char character="&#x1d540;" string="\mathbb{I}"/>
    <!--= \mathds{J} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL J-->
    <char character="&#x1d541;" string="\mathbb{J}"/>
    <!--= \mathds{K} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL K-->
    <char character="&#x1d542;" string="\mathbb{K}"/>
    <!--= \mathds{L} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL L-->
    <char character="&#x1d543;" string="\mathbb{L}"/>
    <!--= \mathds{M} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL M-->
    <char character="&#x1d544;" string="\mathbb{M}"/>
    <!--= \mathds{O} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL O-->
    <char character="&#x1d546;" string="\mathbb{O}"/>
    <!--= \mathds{S} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL S-->
    <char character="&#x1d54a;" string="\mathbb{S}"/>
    <!--= \mathds{T} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL T-->
    <char character="&#x1d54b;" string="\mathbb{T}"/>
    <!--= \mathds{U} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL U-->
    <char character="&#x1d54c;" string="\mathbb{U}"/>
    <!--= \mathds{V} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL V-->
    <char character="&#x1d54d;" string="\mathbb{V}"/>
    <!--= \mathds{W} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL W-->
    <char character="&#x1d54e;" string="\mathbb{W}"/>
    <!--= \mathds{X} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL X-->
    <char character="&#x1d54f;" string="\mathbb{X}"/>
    <!--= \mathds{Y} (dsfont), matMATHEMATICAL DOUBLE-STRUCK CAPITAL Y-->
    <char character="&#x1d550;" string="\mathbb{Y}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL A-->
    <char character="&#x1d552;" string="\mathbb{a}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL B-->
    <char character="&#x1d553;" string="\mathbb{b}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL C-->
    <char character="&#x1d554;" string="\mathbb{c}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL D-->
    <char character="&#x1d555;" string="\mathbb{d}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL E-->
    <char character="&#x1d556;" string="\mathbb{e}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL F-->
    <char character="&#x1d557;" string="\mathbb{f}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL G-->
    <char character="&#x1d558;" string="\mathbb{g}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL H-->
    <char character="&#x1d559;" string="\mathbb{h}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL I-->
    <char character="&#x1d55a;" string="\mathbb{i}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL J-->
    <char character="&#x1d55b;" string="\mathbb{j}"/>
    <!--= \Bbbk (amssymb), MATHEMATICAL DOUBLE-STRUCK SMALL K-->
    <char character="&#x1d55c;" string="\mathbb{k}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL L-->
    <char character="&#x1d55d;" string="\mathbb{l}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL M-->
    <char character="&#x1d55e;" string="\mathbb{m}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL N-->
    <char character="&#x1d55f;" string="\mathbb{n}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL O-->
    <char character="&#x1d560;" string="\mathbb{o}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL P-->
    <char character="&#x1d561;" string="\mathbb{p}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL Q-->
    <char character="&#x1d562;" string="\mathbb{q}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL R-->
    <char character="&#x1d563;" string="\mathbb{r}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL S-->
    <char character="&#x1d564;" string="\mathbb{s}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL T-->
    <char character="&#x1d565;" string="\mathbb{t}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL U-->
    <char character="&#x1d566;" string="\mathbb{u}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL V-->
    <char character="&#x1d567;" string="\mathbb{v}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL W-->
    <char character="&#x1d568;" string="\mathbb{w}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL X-->
    <char character="&#x1d569;" string="\mathbb{x}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL Y-->
    <char character="&#x1d56a;" string="\mathbb{y}"/>
    <!--MATHEMATICAL DOUBLE-STRUCK SMALL Z-->
    <char character="&#x1d56b;" string="\mathbb{z}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL A-->
    <char character="&#x1d5a0;" string="\mathsf{A}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL B-->
    <char character="&#x1d5a1;" string="\mathsf{B}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL C-->
    <char character="&#x1d5a2;" string="\mathsf{C}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL D-->
    <char character="&#x1d5a3;" string="\mathsf{D}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL E-->
    <char character="&#x1d5a4;" string="\mathsf{E}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL F-->
    <char character="&#x1d5a5;" string="\mathsf{F}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL G-->
    <char character="&#x1d5a6;" string="\mathsf{G}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL H-->
    <char character="&#x1d5a7;" string="\mathsf{H}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL I-->
    <char character="&#x1d5a8;" string="\mathsf{I}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL J-->
    <char character="&#x1d5a9;" string="\mathsf{J}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL K-->
    <char character="&#x1d5aa;" string="\mathsf{K}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL L-->
    <char character="&#x1d5ab;" string="\mathsf{L}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL M-->
    <char character="&#x1d5ac;" string="\mathsf{M}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL N-->
    <char character="&#x1d5ad;" string="\mathsf{N}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL O-->
    <char character="&#x1d5ae;" string="\mathsf{O}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL P-->
    <char character="&#x1d5af;" string="\mathsf{P}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL Q-->
    <char character="&#x1d5b0;" string="\mathsf{Q}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL R-->
    <char character="&#x1d5b1;" string="\mathsf{R}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL S-->
    <char character="&#x1d5b2;" string="\mathsf{S}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL T-->
    <char character="&#x1d5b3;" string="\mathsf{T}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL U-->
    <char character="&#x1d5b4;" string="\mathsf{U}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL V-->
    <char character="&#x1d5b5;" string="\mathsf{V}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL W-->
    <char character="&#x1d5b6;" string="\mathsf{W}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL X-->
    <char character="&#x1d5b7;" string="\mathsf{X}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL Y-->
    <char character="&#x1d5b8;" string="\mathsf{Y}"/>
    <!--MATHEMATICAL SANS-SERIF CAPITAL Z-->
    <char character="&#x1d5b9;" string="\mathsf{Z}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL A-->
    <char character="&#x1d5ba;" string="\mathsf{a}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL B-->
    <char character="&#x1d5bb;" string="\mathsf{b}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL C-->
    <char character="&#x1d5bc;" string="\mathsf{c}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL D-->
    <char character="&#x1d5bd;" string="\mathsf{d}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL E-->
    <char character="&#x1d5be;" string="\mathsf{e}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL F-->
    <char character="&#x1d5bf;" string="\mathsf{f}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL G-->
    <char character="&#x1d5c0;" string="\mathsf{g}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL H-->
    <char character="&#x1d5c1;" string="\mathsf{h}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL I-->
    <char character="&#x1d5c2;" string="\mathsf{i}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL J-->
    <char character="&#x1d5c3;" string="\mathsf{j}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL K-->
    <char character="&#x1d5c4;" string="\mathsf{k}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL L-->
    <char character="&#x1d5c5;" string="\mathsf{l}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL M-->
    <char character="&#x1d5c6;" string="\mathsf{m}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL N-->
    <char character="&#x1d5c7;" string="\mathsf{n}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL O-->
    <char character="&#x1d5c8;" string="\mathsf{o}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL P-->
    <char character="&#x1d5c9;" string="\mathsf{p}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL Q-->
    <char character="&#x1d5ca;" string="\mathsf{q}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL R-->
    <char character="&#x1d5cb;" string="\mathsf{r}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL S-->
    <char character="&#x1d5cc;" string="\mathsf{s}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL T-->
    <char character="&#x1d5cd;" string="\mathsf{t}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL U-->
    <char character="&#x1d5ce;" string="\mathsf{u}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL V-->
    <char character="&#x1d5cf;" string="\mathsf{v}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL W-->
    <char character="&#x1d5d0;" string="\mathsf{w}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL X-->
    <char character="&#x1d5d1;" string="\mathsf{x}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL Y-->
    <char character="&#x1d5d2;" string="\mathsf{y}"/>
    <!--MATHEMATICAL SANS-SERIF SMALL Z-->
    <char character="&#x1d5d3;" string="\mathsf{z}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL A-->
    <char character="&#x1d5d4;" string="\mathsfbf{A}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL B-->
    <char character="&#x1d5d5;" string="\mathsfbf{B}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL C-->
    <char character="&#x1d5d6;" string="\mathsfbf{C}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL D-->
    <char character="&#x1d5d7;" string="\mathsfbf{D}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL E-->
    <char character="&#x1d5d8;" string="\mathsfbf{E}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL F-->
    <char character="&#x1d5d9;" string="\mathsfbf{F}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL G-->
    <char character="&#x1d5da;" string="\mathsfbf{G}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL H-->
    <char character="&#x1d5db;" string="\mathsfbf{H}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL I-->
    <char character="&#x1d5dc;" string="\mathsfbf{I}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL J-->
    <char character="&#x1d5dd;" string="\mathsfbf{J}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL K-->
    <char character="&#x1d5de;" string="\mathsfbf{K}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL L-->
    <char character="&#x1d5df;" string="\mathsfbf{L}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL M-->
    <char character="&#x1d5e0;" string="\mathsfbf{M}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL N-->
    <char character="&#x1d5e1;" string="\mathsfbf{N}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL O-->
    <char character="&#x1d5e2;" string="\mathsfbf{O}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL P-->
    <char character="&#x1d5e3;" string="\mathsfbf{P}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL Q-->
    <char character="&#x1d5e4;" string="\mathsfbf{Q}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL R-->
    <char character="&#x1d5e5;" string="\mathsfbf{R}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL S-->
    <char character="&#x1d5e6;" string="\mathsfbf{S}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL T-->
    <char character="&#x1d5e7;" string="\mathsfbf{T}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL U-->
    <char character="&#x1d5e8;" string="\mathsfbf{U}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL V-->
    <char character="&#x1d5e9;" string="\mathsfbf{V}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL W-->
    <char character="&#x1d5ea;" string="\mathsfbf{W}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL X-->
    <char character="&#x1d5eb;" string="\mathsfbf{X}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL Y-->
    <char character="&#x1d5ec;" string="\mathsfbf{Y}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL Z-->
    <char character="&#x1d5ed;" string="\mathsfbf{Z}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL A-->
    <char character="&#x1d5ee;" string="\mathsfbf{a}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL B-->
    <char character="&#x1d5ef;" string="\mathsfbf{b}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL C-->
    <char character="&#x1d5f0;" string="\mathsfbf{c}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL D-->
    <char character="&#x1d5f1;" string="\mathsfbf{d}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL E-->
    <char character="&#x1d5f2;" string="\mathsfbf{e}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL F-->
    <char character="&#x1d5f3;" string="\mathsfbf{f}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL G-->
    <char character="&#x1d5f4;" string="\mathsfbf{g}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL H-->
    <char character="&#x1d5f5;" string="\mathsfbf{h}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL I-->
    <char character="&#x1d5f6;" string="\mathsfbf{i}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL J-->
    <char character="&#x1d5f7;" string="\mathsfbf{j}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL K-->
    <char character="&#x1d5f8;" string="\mathsfbf{k}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL L-->
    <char character="&#x1d5f9;" string="\mathsfbf{l}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL M-->
    <char character="&#x1d5fa;" string="\mathsfbf{m}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL N-->
    <char character="&#x1d5fb;" string="\mathsfbf{n}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL O-->
    <char character="&#x1d5fc;" string="\mathsfbf{o}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL P-->
    <char character="&#x1d5fd;" string="\mathsfbf{p}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL Q-->
    <char character="&#x1d5fe;" string="\mathsfbf{q}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL R-->
    <char character="&#x1d5ff;" string="\mathsfbf{r}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL S-->
    <char character="&#x1d600;" string="\mathsfbf{s}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL T-->
    <char character="&#x1d601;" string="\mathsfbf{t}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL U-->
    <char character="&#x1d602;" string="\mathsfbf{u}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL V-->
    <char character="&#x1d603;" string="\mathsfbf{v}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL W-->
    <char character="&#x1d604;" string="\mathsfbf{w}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL X-->
    <char character="&#x1d605;" string="\mathsfbf{x}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL Y-->
    <char character="&#x1d606;" string="\mathsfbf{y}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL Z-->
    <char character="&#x1d607;" string="\mathsfbf{z}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL A-->
    <char character="&#x1d608;" string="\mathsfit{A}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL B-->
    <char character="&#x1d609;" string="\mathsfit{B}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL C-->
    <char character="&#x1d60a;" string="\mathsfit{C}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL D-->
    <char character="&#x1d60b;" string="\mathsfit{D}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL E-->
    <char character="&#x1d60c;" string="\mathsfit{E}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL F-->
    <char character="&#x1d60d;" string="\mathsfit{F}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL G-->
    <char character="&#x1d60e;" string="\mathsfit{G}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL H-->
    <char character="&#x1d60f;" string="\mathsfit{H}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL I-->
    <char character="&#x1d610;" string="\mathsfit{I}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL J-->
    <char character="&#x1d611;" string="\mathsfit{J}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL K-->
    <char character="&#x1d612;" string="\mathsfit{K}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL L-->
    <char character="&#x1d613;" string="\mathsfit{L}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL M-->
    <char character="&#x1d614;" string="\mathsfit{M}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL N-->
    <char character="&#x1d615;" string="\mathsfit{N}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL O-->
    <char character="&#x1d616;" string="\mathsfit{O}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL P-->
    <char character="&#x1d617;" string="\mathsfit{P}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL Q-->
    <char character="&#x1d618;" string="\mathsfit{Q}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL R-->
    <char character="&#x1d619;" string="\mathsfit{R}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL S-->
    <char character="&#x1d61a;" string="\mathsfit{S}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL T-->
    <char character="&#x1d61b;" string="\mathsfit{T}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL U-->
    <char character="&#x1d61c;" string="\mathsfit{U}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL V-->
    <char character="&#x1d61d;" string="\mathsfit{V}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL W-->
    <char character="&#x1d61e;" string="\mathsfit{W}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL X-->
    <char character="&#x1d61f;" string="\mathsfit{X}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL Y-->
    <char character="&#x1d620;" string="\mathsfit{Y}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC CAPITAL Z-->
    <char character="&#x1d621;" string="\mathsfit{Z}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL A-->
    <char character="&#x1d622;" string="\mathsfit{a}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL B-->
    <char character="&#x1d623;" string="\mathsfit{b}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL C-->
    <char character="&#x1d624;" string="\mathsfit{c}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL D-->
    <char character="&#x1d625;" string="\mathsfit{d}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL E-->
    <char character="&#x1d626;" string="\mathsfit{e}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL F-->
    <char character="&#x1d627;" string="\mathsfit{f}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL G-->
    <char character="&#x1d628;" string="\mathsfit{g}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL H-->
    <char character="&#x1d629;" string="\mathsfit{h}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL I-->
    <char character="&#x1d62a;" string="\mathsfit{i}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL J-->
    <char character="&#x1d62b;" string="\mathsfit{j}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL K-->
    <char character="&#x1d62c;" string="\mathsfit{k}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL L-->
    <char character="&#x1d62d;" string="\mathsfit{l}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL M-->
    <char character="&#x1d62e;" string="\mathsfit{m}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL N-->
    <char character="&#x1d62f;" string="\mathsfit{n}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL O-->
    <char character="&#x1d630;" string="\mathsfit{o}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL P-->
    <char character="&#x1d631;" string="\mathsfit{p}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL Q-->
    <char character="&#x1d632;" string="\mathsfit{q}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL R-->
    <char character="&#x1d633;" string="\mathsfit{r}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL S-->
    <char character="&#x1d634;" string="\mathsfit{s}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL T-->
    <char character="&#x1d635;" string="\mathsfit{t}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL U-->
    <char character="&#x1d636;" string="\mathsfit{u}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL V-->
    <char character="&#x1d637;" string="\mathsfit{v}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL W-->
    <char character="&#x1d638;" string="\mathsfit{w}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL X-->
    <char character="&#x1d639;" string="\mathsfit{x}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL Y-->
    <char character="&#x1d63a;" string="\mathsfit{y}"/>
    <!--MATHEMATICAL SANS-SERIF ITALIC SMALL Z-->
    <char character="&#x1d63b;" string="\mathsfit{z}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL A-->
    <char character="&#x1d63c;" string="\mathsfbfit{A}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL B-->
    <char character="&#x1d63d;" string="\mathsfbfit{B}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL C-->
    <char character="&#x1d63e;" string="\mathsfbfit{C}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL D-->
    <char character="&#x1d63f;" string="\mathsfbfit{D}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL E-->
    <char character="&#x1d640;" string="\mathsfbfit{E}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL F-->
    <char character="&#x1d641;" string="\mathsfbfit{F}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL G-->
    <char character="&#x1d642;" string="\mathsfbfit{G}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL H-->
    <char character="&#x1d643;" string="\mathsfbfit{H}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL I-->
    <char character="&#x1d644;" string="\mathsfbfit{I}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL J-->
    <char character="&#x1d645;" string="\mathsfbfit{J}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL K-->
    <char character="&#x1d646;" string="\mathsfbfit{K}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL L-->
    <char character="&#x1d647;" string="\mathsfbfit{L}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL M-->
    <char character="&#x1d648;" string="\mathsfbfit{M}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL N-->
    <char character="&#x1d649;" string="\mathsfbfit{N}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL O-->
    <char character="&#x1d64a;" string="\mathsfbfit{O}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL P-->
    <char character="&#x1d64b;" string="\mathsfbfit{P}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL Q-->
    <char character="&#x1d64c;" string="\mathsfbfit{Q}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL R-->
    <char character="&#x1d64d;" string="\mathsfbfit{R}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL S-->
    <char character="&#x1d64e;" string="\mathsfbfit{S}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL T-->
    <char character="&#x1d64f;" string="\mathsfbfit{T}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL U-->
    <char character="&#x1d650;" string="\mathsfbfit{U}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL V-->
    <char character="&#x1d651;" string="\mathsfbfit{V}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL W-->
    <char character="&#x1d652;" string="\mathsfbfit{W}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL X-->
    <char character="&#x1d653;" string="\mathsfbfit{X}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL Y-->
    <char character="&#x1d654;" string="\mathsfbfit{Y}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL Z-->
    <char character="&#x1d655;" string="\mathsfbfit{Z}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL A-->
    <char character="&#x1d656;" string="\mathsfbfit{a}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL B-->
    <char character="&#x1d657;" string="\mathsfbfit{b}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL C-->
    <char character="&#x1d658;" string="\mathsfbfit{c}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL D-->
    <char character="&#x1d659;" string="\mathsfbfit{d}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL E-->
    <char character="&#x1d65a;" string="\mathsfbfit{e}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL F-->
    <char character="&#x1d65b;" string="\mathsfbfit{f}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL G-->
    <char character="&#x1d65c;" string="\mathsfbfit{g}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL H-->
    <char character="&#x1d65d;" string="\mathsfbfit{h}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL I-->
    <char character="&#x1d65e;" string="\mathsfbfit{i}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL J-->
    <char character="&#x1d65f;" string="\mathsfbfit{j}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL K-->
    <char character="&#x1d660;" string="\mathsfbfit{k}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL L-->
    <char character="&#x1d661;" string="\mathsfbfit{l}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL M-->
    <char character="&#x1d662;" string="\mathsfbfit{m}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL N-->
    <char character="&#x1d663;" string="\mathsfbfit{n}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL O-->
    <char character="&#x1d664;" string="\mathsfbfit{o}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL P-->
    <char character="&#x1d665;" string="\mathsfbfit{p}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL Q-->
    <char character="&#x1d666;" string="\mathsfbfit{q}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL R-->
    <char character="&#x1d667;" string="\mathsfbfit{r}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL S-->
    <char character="&#x1d668;" string="\mathsfbfit{s}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL T-->
    <char character="&#x1d669;" string="\mathsfbfit{t}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL U-->
    <char character="&#x1d66a;" string="\mathsfbfit{u}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL V-->
    <char character="&#x1d66b;" string="\mathsfbfit{v}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL W-->
    <char character="&#x1d66c;" string="\mathsfbfit{w}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL X-->
    <char character="&#x1d66d;" string="\mathsfbfit{x}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL Y-->
    <char character="&#x1d66e;" string="\mathsfbfit{y}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL Z-->
    <char character="&#x1d66f;" string="\mathsfbfit{z}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL A-->
    <char character="&#x1d670;" string="\mathtt{A}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL B-->
    <char character="&#x1d671;" string="\mathtt{B}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL C-->
    <char character="&#x1d672;" string="\mathtt{C}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL D-->
    <char character="&#x1d673;" string="\mathtt{D}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL E-->
    <char character="&#x1d674;" string="\mathtt{E}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL F-->
    <char character="&#x1d675;" string="\mathtt{F}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL G-->
    <char character="&#x1d676;" string="\mathtt{G}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL H-->
    <char character="&#x1d677;" string="\mathtt{H}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL I-->
    <char character="&#x1d678;" string="\mathtt{I}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL J-->
    <char character="&#x1d679;" string="\mathtt{J}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL K-->
    <char character="&#x1d67a;" string="\mathtt{K}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL L-->
    <char character="&#x1d67b;" string="\mathtt{L}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL M-->
    <char character="&#x1d67c;" string="\mathtt{M}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL N-->
    <char character="&#x1d67d;" string="\mathtt{N}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL O-->
    <char character="&#x1d67e;" string="\mathtt{O}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL P-->
    <char character="&#x1d67f;" string="\mathtt{P}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL Q-->
    <char character="&#x1d680;" string="\mathtt{Q}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL R-->
    <char character="&#x1d681;" string="\mathtt{R}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL S-->
    <char character="&#x1d682;" string="\mathtt{S}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL T-->
    <char character="&#x1d683;" string="\mathtt{T}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL U-->
    <char character="&#x1d684;" string="\mathtt{U}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL V-->
    <char character="&#x1d685;" string="\mathtt{V}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL W-->
    <char character="&#x1d686;" string="\mathtt{W}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL X-->
    <char character="&#x1d687;" string="\mathtt{X}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL Y-->
    <char character="&#x1d688;" string="\mathtt{Y}"/>
    <!--MATHEMATICAL MONOSPACE CAPITAL Z-->
    <char character="&#x1d689;" string="\mathtt{Z}"/>
    <!--MATHEMATICAL MONOSPACE SMALL A-->
    <char character="&#x1d68a;" string="\mathtt{a}"/>
    <!--MATHEMATICAL MONOSPACE SMALL B-->
    <char character="&#x1d68b;" string="\mathtt{b}"/>
    <!--MATHEMATICAL MONOSPACE SMALL C-->
    <char character="&#x1d68c;" string="\mathtt{c}"/>
    <!--MATHEMATICAL MONOSPACE SMALL D-->
    <char character="&#x1d68d;" string="\mathtt{d}"/>
    <!--MATHEMATICAL MONOSPACE SMALL E-->
    <char character="&#x1d68e;" string="\mathtt{e}"/>
    <!--MATHEMATICAL MONOSPACE SMALL F-->
    <char character="&#x1d68f;" string="\mathtt{f}"/>
    <!--MATHEMATICAL MONOSPACE SMALL G-->
    <char character="&#x1d690;" string="\mathtt{g}"/>
    <!--MATHEMATICAL MONOSPACE SMALL H-->
    <char character="&#x1d691;" string="\mathtt{h}"/>
    <!--MATHEMATICAL MONOSPACE SMALL I-->
    <char character="&#x1d692;" string="\mathtt{i}"/>
    <!--MATHEMATICAL MONOSPACE SMALL J-->
    <char character="&#x1d693;" string="\mathtt{j}"/>
    <!--MATHEMATICAL MONOSPACE SMALL K-->
    <char character="&#x1d694;" string="\mathtt{k}"/>
    <!--MATHEMATICAL MONOSPACE SMALL L-->
    <char character="&#x1d695;" string="\mathtt{l}"/>
    <!--MATHEMATICAL MONOSPACE SMALL M-->
    <char character="&#x1d696;" string="\mathtt{m}"/>
    <!--MATHEMATICAL MONOSPACE SMALL N-->
    <char character="&#x1d697;" string="\mathtt{n}"/>
    <!--MATHEMATICAL MONOSPACE SMALL O-->
    <char character="&#x1d698;" string="\mathtt{o}"/>
    <!--MATHEMATICAL MONOSPACE SMALL P-->
    <char character="&#x1d699;" string="\mathtt{p}"/>
    <!--MATHEMATICAL MONOSPACE SMALL Q-->
    <char character="&#x1d69a;" string="\mathtt{q}"/>
    <!--MATHEMATICAL MONOSPACE SMALL R-->
    <char character="&#x1d69b;" string="\mathtt{r}"/>
    <!--MATHEMATICAL MONOSPACE SMALL S-->
    <char character="&#x1d69c;" string="\mathtt{s}"/>
    <!--MATHEMATICAL MONOSPACE SMALL T-->
    <char character="&#x1d69d;" string="\mathtt{t}"/>
    <!--MATHEMATICAL MONOSPACE SMALL U-->
    <char character="&#x1d69e;" string="\mathtt{u}"/>
    <!--MATHEMATICAL MONOSPACE SMALL V-->
    <char character="&#x1d69f;" string="\mathtt{v}"/>
    <!--MATHEMATICAL MONOSPACE SMALL W-->
    <char character="&#x1d6a0;" string="\mathtt{w}"/>
    <!--MATHEMATICAL MONOSPACE SMALL X-->
    <char character="&#x1d6a1;" string="\mathtt{x}"/>
    <!--MATHEMATICAL MONOSPACE SMALL Y-->
    <char character="&#x1d6a2;" string="\mathtt{y}"/>
    <!--MATHEMATICAL MONOSPACE SMALL Z-->
    <char character="&#x1d6a3;" string="\mathtt{z}"/>
    <!--MATHEMATICAL ITALIC SMALL DOTLESS I-->
    <char character="&#x1d6a4;" string="\imath"/>
    <!--MATHEMATICAL ITALIC SMALL DOTLESS J-->
    <char character="&#x1d6a5;" string="\jmath"/>
    <!--MATHEMATICAL BOLD CAPITAL GAMMA-->
    <char character="&#x1d6aa;" string="\mathbf{\Gamma}"/>
    <!--MATHEMATICAL BOLD CAPITAL DELTA-->
    <char character="&#x1d6ab;" string="\mathbf{\Delta}"/>
    <!--MATHEMATICAL BOLD CAPITAL THETA-->
    <char character="&#x1d6af;" string="\mathbf{\Theta}"/>
    <!--mathematical bold capital lambda-->
    <char character="&#x1d6b2;" string="\mathbf{\Lambda}"/>
    <!--MATHEMATICAL BOLD CAPITAL XI-->
    <char character="&#x1d6b5;" string="\mathbf{\Xi}"/>
    <!--MATHEMATICAL BOLD CAPITAL PI-->
    <char character="&#x1d6b7;" string="\mathbf{\Pi}"/>
    <!--MATHEMATICAL BOLD CAPITAL SIGMA-->
    <char character="&#x1d6ba;" string="\mathbf{\Sigma}"/>
    <!--MATHEMATICAL BOLD CAPITAL UPSILON-->
    <char character="&#x1d6bc;" string="\mathbf{\Upsilon}"/>
    <!--MATHEMATICAL BOLD CAPITAL PHI-->
    <char character="&#x1d6bd;" string="\mathbf{\Phi}"/>
    <!--MATHEMATICAL BOLD CAPITAL PSI-->
    <char character="&#x1d6bf;" string="\mathbf{\Psi}"/>
    <!--MATHEMATICAL BOLD CAPITAL OMEGA-->
    <char character="&#x1d6c0;" string="\mathbf{\Omega}"/>
    <!--MATHEMATICAL BOLD SMALL ALPHA-->
    <char character="&#x1d6c2;" string="\mathbf{\alpha}"/>
    <!--MATHEMATICAL BOLD SMALL BETA-->
    <char character="&#x1d6c3;" string="\mathbf{\beta}"/>
    <!--MATHEMATICAL BOLD SMALL GAMMA-->
    <char character="&#x1d6c4;" string="\mathbf{\gamma}"/>
    <!--MATHEMATICAL BOLD SMALL DELTA-->
    <char character="&#x1d6c5;" string="\mathbf{\delta}"/>
    <!--MATHEMATICAL BOLD SMALL EPSILON-->
    <char character="&#x1d6c6;" string="\mathbf{\varepsilon}"/>
    <!--MATHEMATICAL BOLD SMALL ZETA-->
    <char character="&#x1d6c7;" string="\mathbf{\zeta}"/>
    <!--MATHEMATICAL BOLD SMALL ETA-->
    <char character="&#x1d6c8;" string="\mathbf{\eta}"/>
    <!--MATHEMATICAL BOLD SMALL THETA-->
    <char character="&#x1d6c9;" string="\mathbf{\theta}"/>
    <!--MATHEMATICAL BOLD SMALL IOTA-->
    <char character="&#x1d6ca;" string="\mathbf{\iota}"/>
    <!--MATHEMATICAL BOLD SMALL KAPPA-->
    <char character="&#x1d6cb;" string="\mathbf{\kappa}"/>
    <!--mathematical bold small lambda-->
    <char character="&#x1d6cc;" string="\mathbf{\lambda}"/>
    <!--MATHEMATICAL BOLD SMALL MU-->
    <char character="&#x1d6cd;" string="\mathbf{\mu}"/>
    <!--MATHEMATICAL BOLD SMALL NU-->
    <char character="&#x1d6ce;" string="\mathbf{\nu}"/>
    <!--MATHEMATICAL BOLD SMALL XI-->
    <char character="&#x1d6cf;" string="\mathbf{\xi}"/>
    <!--MATHEMATICAL BOLD SMALL PI-->
    <char character="&#x1d6d1;" string="\mathbf{\pi}"/>
    <!--MATHEMATICAL BOLD SMALL RHO-->
    <char character="&#x1d6d2;" string="\mathbf{\rho}"/>
    <!--MATHEMATICAL BOLD SMALL FINAL SIGMA-->
    <char character="&#x1d6d3;" string="\mathbf{\varsigma}"/>
    <!--MATHEMATICAL BOLD SMALL SIGMA-->
    <char character="&#x1d6d4;" string="\mathbf{\sigma}"/>
    <!--MATHEMATICAL BOLD SMALL TAU-->
    <char character="&#x1d6d5;" string="\mathbf{\tau}"/>
    <!--MATHEMATICAL BOLD SMALL UPSILON-->
    <char character="&#x1d6d6;" string="\mathbf{\upsilon}"/>
    <!--MATHEMATICAL BOLD SMALL PHI-->
    <char character="&#x1d6d7;" string="\mathbf{\varphi}"/>
    <!--MATHEMATICAL BOLD SMALL CHI-->
    <char character="&#x1d6d8;" string="\mathbf{\chi}"/>
    <!--MATHEMATICAL BOLD SMALL PSI-->
    <char character="&#x1d6d9;" string="\mathbf{\psi}"/>
    <!--MATHEMATICAL BOLD SMALL OMEGA-->
    <char character="&#x1d6da;" string="\mathbf{\omega}"/>
    <!--MATHEMATICAL BOLD EPSILON SYMBOL-->
    <char character="&#x1d6dc;" string="\mathbf{\epsilon}"/>
    <!--MATHEMATICAL BOLD THETA SYMBOL-->
    <char character="&#x1d6dd;" string="\mathbf{\vartheta}"/>
    <!--MATHEMATICAL BOLD PHI SYMBOL-->
    <char character="&#x1d6df;" string="\mathbf{\phi}"/>
    <!--MATHEMATICAL BOLD RHO SYMBOL-->
    <char character="&#x1d6e0;" string="\mathbf{\varrho}"/>
    <!--MATHEMATICAL BOLD PI SYMBOL-->
    <char character="&#x1d6e1;" string="\mathbf{\varpi}"/>
    <!--= \mathit{\Gamma} (-fourier), = \varGamma (amsmath fourier), MATHEMATICAL ITALIC CAPITAL GAMMA-->
    <char character="&#x1d6e4;" string="\Gamma"/>
    <!--= \mathit{\Delta} (-fourier), = \varDelta (amsmath fourier), MATHEMATICAL ITALIC CAPITAL DELTA-->
    <char character="&#x1d6e5;" string="\Delta"/>
    <!--= \mathit{\Theta} (-fourier), = \varTheta (amsmath fourier), MATHEMATICAL ITALIC CAPITAL THETA-->
    <char character="&#x1d6e9;" string="\Theta"/>
    <!--= \mathit{\Lambda} (-fourier), = \varLambda (amsmath fourier), mathematical italic capital lambda-->
    <char character="&#x1d6ec;" string="\Lambda"/>
    <!--= \mathit{\Xi} (-fourier), = \varXi (amsmath fourier), MATHEMATICAL ITALIC CAPITAL XI-->
    <char character="&#x1d6ef;" string="\Xi"/>
    <!--= \mathit{\Pi} (-fourier), = \varPi (amsmath fourier), MATHEMATICAL ITALIC CAPITAL PI-->
    <char character="&#x1d6f1;" string="\Pi"/>
    <!--= \mathit{\Sigma} (-fourier), = \varSigma (amsmath fourier), MATHEMATICAL ITALIC CAPITAL SIGMA-->
    <char character="&#x1d6f4;" string="\Sigma"/>
    <!--= \mathit{\Upsilon} (-fourier), = \varUpsilon (amsmath fourier), MATHEMATICAL ITALIC CAPITAL UPSILON-->
    <char character="&#x1d6f6;" string="\Upsilon"/>
    <!--= \mathit{\Phi} (-fourier), = \varPhi (amsmath fourier), MATHEMATICAL ITALIC CAPITAL PHI-->
    <char character="&#x1d6f7;" string="\Phi"/>
    <!--= \mathit{\Psi} (-fourier), = \varPsi (amsmath fourier), MATHEMATICAL ITALIC CAPITAL PSI-->
    <char character="&#x1d6f9;" string="\Psi"/>
    <!--= \mathit{\Omega} (-fourier), = \varOmega (amsmath fourier), MATHEMATICAL ITALIC CAPITAL OMEGA-->
    <char character="&#x1d6fa;" string="\Omega"/>
    <!--= \mathit{\alpha} (omlmathit), MATHEMATICAL ITALIC SMALL ALPHA-->
    <char character="&#x1d6fc;" string="\alpha"/>
    <!--= \mathit{\beta} (omlmathit), MATHEMATICAL ITALIC SMALL BETA-->
    <char character="&#x1d6fd;" string="\beta"/>
    <!--= \mathit{\gamma} (omlmathit), MATHEMATICAL ITALIC SMALL GAMMA-->
    <char character="&#x1d6fe;" string="\gamma"/>
    <!--= \mathit{\delta} (omlmathit), MATHEMATICAL ITALIC SMALL DELTA-->
    <char character="&#x1d6ff;" string="\delta"/>
    <!--= \mathit{\varepsilon} (omlmathit), MATHEMATICAL ITALIC SMALL EPSILON-->
    <char character="&#x1d700;" string="\varepsilon"/>
    <!--= \mathit{\zeta} (omlmathit), MATHEMATICAL ITALIC SMALL ZETA-->
    <char character="&#x1d701;" string="\zeta"/>
    <!--= \mathit{\eta} (omlmathit), MATHEMATICAL ITALIC SMALL ETA-->
    <char character="&#x1d702;" string="\eta"/>
    <!--= \mathit{\theta} (omlmathit), MATHEMATICAL ITALIC SMALL THETA-->
    <char character="&#x1d703;" string="\theta"/>
    <!--= \mathit{\iota} (omlmathit), MATHEMATICAL ITALIC SMALL IOTA-->
    <char character="&#x1d704;" string="\iota"/>
    <!--= \mathit{\kappa} (omlmathit), MATHEMATICAL ITALIC SMALL KAPPA-->
    <char character="&#x1d705;" string="\kappa"/>
    <!--= \mathit{\lambda} (omlmathit), mathematical italic small lambda-->
    <char character="&#x1d706;" string="\lambda"/>
    <!--= \mathit{\mu} (omlmathit), MATHEMATICAL ITALIC SMALL MU-->
    <char character="&#x1d707;" string="\mu"/>
    <!--= \mathit{\nu} (omlmathit), MATHEMATICAL ITALIC SMALL NU-->
    <char character="&#x1d708;" string="\nu"/>
    <!--= \mathit{\xi} (omlmathit), MATHEMATICAL ITALIC SMALL XI-->
    <char character="&#x1d709;" string="\xi"/>
    <!--= \mathit{\pi} (omlmathit), MATHEMATICAL ITALIC SMALL PI-->
    <char character="&#x1d70b;" string="\pi"/>
    <!--= \mathit{\rho} (omlmathit), MATHEMATICAL ITALIC SMALL RHO-->
    <char character="&#x1d70c;" string="\rho"/>
    <!--= \mathit{\varsigma} (omlmathit), MATHEMATICAL ITALIC SMALL FINAL SIGMA-->
    <char character="&#x1d70d;" string="\varsigma"/>
    <!--= \mathit{\sigma} (omlmathit), MATHEMATICAL ITALIC SMALL SIGMA-->
    <char character="&#x1d70e;" string="\sigma"/>
    <!--= \mathit{\tau} (omlmathit), MATHEMATICAL ITALIC SMALL TAU-->
    <char character="&#x1d70f;" string="\tau"/>
    <!--= \mathit{\upsilon} (omlmathit), MATHEMATICAL ITALIC SMALL UPSILON-->
    <char character="&#x1d710;" string="\upsilon"/>
    <!--= \mathit{\varphi} (omlmathit), MATHEMATICAL ITALIC SMALL PHI-->
    <char character="&#x1d711;" string="\varphi"/>
    <!--= \mathit{\chi} (omlmathit), MATHEMATICAL ITALIC SMALL CHI-->
    <char character="&#x1d712;" string="\chi"/>
    <!--= \mathit{\psi} (omlmathit), MATHEMATICAL ITALIC SMALL PSI-->
    <char character="&#x1d713;" string="\psi"/>
    <!--= \mathit{\omega} (omlmathit), MATHEMATICAL ITALIC SMALL OMEGA-->
    <char character="&#x1d714;" string="\omega"/>
    <!--= \mathit{\partial} (omlmathit), MATHEMATICAL ITALIC PARTIAL DIFFERENTIAL-->
    <char character="&#x1d715;" string="\partial"/>
    <!--= \mathit{\epsilon} (omlmathit), MATHEMATICAL ITALIC EPSILON SYMBOL-->
    <char character="&#x1d716;" string="\epsilon"/>
    <!--= \mathit{\vartheta} (omlmathit), MATHEMATICAL ITALIC THETA SYMBOL-->
    <char character="&#x1d717;" string="\vartheta"/>
    <!--MATHEMATICAL ITALIC KAPPA SYMBOL-->
    <char character="&#x1d718;" string="\varkappa"/>
    <!--= \mathit{\phi} (omlmathit), MATHEMATICAL ITALIC PHI SYMBOL-->
    <char character="&#x1d719;" string="\phi"/>
    <!--= \mathit{\varrho} (omlmathit), MATHEMATICAL ITALIC RHO SYMBOL-->
    <char character="&#x1d71a;" string="\varrho"/>
    <!--= \mathit{\varpi} (omlmathit), MATHEMATICAL ITALIC PI SYMBOL-->
    <char character="&#x1d71b;" string="\varpi"/>
    <!--= \mathbold{\Gamma} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL GAMMA-->
    <char character="&#x1d71e;" string="\mathbfit{\Gamma}"/>
    <!--= \mathbold{\Delta} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL DELTA-->
    <char character="&#x1d71f;" string="\mathbfit{\Delta}"/>
    <!--= \mathbold{\Theta} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL THETA-->
    <char character="&#x1d723;" string="\mathbfit{\Theta}"/>
    <!--= \mathbold{\Lambda} (fixmath), mathematical bold italic capital lambda-->
    <char character="&#x1d726;" string="\mathbfit{\Lambda}"/>
    <!--= \mathbold{\Xi} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL XI-->
    <char character="&#x1d729;" string="\mathbfit{\Xi}"/>
    <!--= \mathbold{\Pi} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL PI-->
    <char character="&#x1d72b;" string="\mathbfit{\Pi}"/>
    <!--= \mathbold{\Sigma} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL SIGMA-->
    <char character="&#x1d72e;" string="\mathbfit{\Sigma}"/>
    <!--= \mathbold{\Upsilon} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL UPSILON-->
    <char character="&#x1d730;" string="\mathbfit{\Upsilon}"/>
    <!--= \mathbold{\Phi} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL PHI-->
    <char character="&#x1d731;" string="\mathbfit{\Phi}"/>
    <!--= \mathbold{\Psi} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL PSI-->
    <char character="&#x1d733;" string="\mathbfit{\Psi}"/>
    <!--= \mathbold{\Omega} (fixmath), MATHEMATICAL BOLD ITALIC CAPITAL OMEGA-->
    <char character="&#x1d734;" string="\mathbfit{\Omega}"/>
    <!--= \mathbold{\alpha} (fixmath), MATHEMATICAL BOLD ITALIC SMALL ALPHA-->
    <char character="&#x1d736;" string="\mathbfit{\alpha}"/>
    <!--= \mathbold{\beta} (fixmath), MATHEMATICAL BOLD ITALIC SMALL BETA-->
    <char character="&#x1d737;" string="\mathbfit{\beta}"/>
    <!--= \mathbold{\gamma} (fixmath), MATHEMATICAL BOLD ITALIC SMALL GAMMA-->
    <char character="&#x1d738;" string="\mathbfit{\gamma}"/>
    <!--= \mathbold{\delta} (fixmath), MATHEMATICAL BOLD ITALIC SMALL DELTA-->
    <char character="&#x1d739;" string="\mathbfit{\delta}"/>
    <!--= \mathbold{\varepsilon} (fixmath), MATHEMATICAL BOLD ITALIC SMALL EPSILON-->
    <char character="&#x1d73a;" string="\mathbfit{\varepsilon}"/>
    <!--= \mathbold{\zeta} (fixmath), MATHEMATICAL BOLD ITALIC SMALL ZETA-->
    <char character="&#x1d73b;" string="\mathbfit{\zeta}"/>
    <!--= \mathbold{\eta} (fixmath), MATHEMATICAL BOLD ITALIC SMALL ETA-->
    <char character="&#x1d73c;" string="\mathbfit{\eta}"/>
    <!--= \mathbold{\theta} (fixmath), MATHEMATICAL BOLD ITALIC SMALL THETA-->
    <char character="&#x1d73d;" string="\mathbfit{\theta}"/>
    <!--= \mathbold{\iota} (fixmath), MATHEMATICAL BOLD ITALIC SMALL IOTA-->
    <char character="&#x1d73e;" string="\mathbfit{\iota}"/>
    <!--= \mathbold{\kappa} (fixmath), MATHEMATICAL BOLD ITALIC SMALL KAPPA-->
    <char character="&#x1d73f;" string="\mathbfit{\kappa}"/>
    <!--= \mathbold{\lambda} (fixmath), mathematical bold italic small lambda-->
    <char character="&#x1d740;" string="\mathbfit{\lambda}"/>
    <!--= \mathbold{\mu} (fixmath), MATHEMATICAL BOLD ITALIC SMALL MU-->
    <char character="&#x1d741;" string="\mathbfit{\mu}"/>
    <!--= \mathbold{\nu} (fixmath), MATHEMATICAL BOLD ITALIC SMALL NU-->
    <char character="&#x1d742;" string="\mathbfit{\nu}"/>
    <!--= \mathbold{\xi} (fixmath), MATHEMATICAL BOLD ITALIC SMALL XI-->
    <char character="&#x1d743;" string="\mathbfit{\xi}"/>
    <!--= \mathbold{\pi} (fixmath), MATHEMATICAL BOLD ITALIC SMALL PI-->
    <char character="&#x1d745;" string="\mathbfit{\pi}"/>
    <!--= \mathbold{\rho} (fixmath), MATHEMATICAL BOLD ITALIC SMALL RHO-->
    <char character="&#x1d746;" string="\mathbfit{\rho}"/>
    <!--= \mathbold{\varsigma} (fixmath), MATHEMATICAL BOLD ITALIC SMALL FINAL SIGMA-->
    <char character="&#x1d747;" string="\mathbfit{\varsigma}"/>
    <!--= \mathbold{\sigma} (fixmath), MATHEMATICAL BOLD ITALIC SMALL SIGMA-->
    <char character="&#x1d748;" string="\mathbfit{\sigma}"/>
    <!--= \mathbold{\tau} (fixmath), MATHEMATICAL BOLD ITALIC SMALL TAU-->
    <char character="&#x1d749;" string="\mathbfit{\tau}"/>
    <!--= \mathbold{\upsilon} (fixmath), MATHEMATICAL BOLD ITALIC SMALL UPSILON-->
    <char character="&#x1d74a;" string="\mathbfit{\upsilon}"/>
    <!--= \mathbold{\varphi} (fixmath), MATHEMATICAL BOLD ITALIC SMALL PHI-->
    <char character="&#x1d74b;" string="\mathbfit{\varphi}"/>
    <!--= \mathbold{\chi} (fixmath), MATHEMATICAL BOLD ITALIC SMALL CHI-->
    <char character="&#x1d74c;" string="\mathbfit{\chi}"/>
    <!--= \mathbold{\psi} (fixmath), MATHEMATICAL BOLD ITALIC SMALL PSI-->
    <char character="&#x1d74d;" string="\mathbfit{\psi}"/>
    <!--= \mathbold{\omega} (fixmath), MATHEMATICAL BOLD ITALIC SMALL OMEGA-->
    <char character="&#x1d74e;" string="\mathbfit{\omega}"/>
    <!--= \mathbold{\epsilon} (fixmath), MATHEMATICAL BOLD ITALIC EPSILON SYMBOL-->
    <char character="&#x1d750;" string="\mathbfit{\epsilon}"/>
    <!--= \mathbold{\vartheta} (fixmath), MATHEMATICAL BOLD ITALIC THETA SYMBOL-->
    <char character="&#x1d751;" string="\mathbfit{\vartheta}"/>
    <!--= \mathbold{\phi} (fixmath), MATHEMATICAL BOLD ITALIC PHI SYMBOL-->
    <char character="&#x1d753;" string="\mathbfit{\phi}"/>
    <!--= \mathbold{\varrho} (fixmath), MATHEMATICAL BOLD ITALIC RHO SYMBOL-->
    <char character="&#x1d754;" string="\mathbfit{\varrho}"/>
    <!--= \mathbold{\varpi} (fixmath), MATHEMATICAL BOLD ITALIC PI SYMBOL-->
    <char character="&#x1d755;" string="\mathbfit{\varpi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL GAMMA-->
    <char character="&#x1d758;" string="\mathsfbf{\Gamma}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL DELTA-->
    <char character="&#x1d759;" string="\mathsfbf{\Delta}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL THETA-->
    <char character="&#x1d75d;" string="\mathsfbf{\Theta}"/>
    <!--mathematical sans-serif bold capital lambda-->
    <char character="&#x1d760;" string="\mathsfbf{\Lambda}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL XI-->
    <char character="&#x1d763;" string="\mathsfbf{\Xi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL PI-->
    <char character="&#x1d765;" string="\mathsfbf{\Pi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL SIGMA-->
    <char character="&#x1d768;" string="\mathsfbf{\Sigma}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL UPSILON-->
    <char character="&#x1d76a;" string="\mathsfbf{\Upsilon}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL PHI-->
    <char character="&#x1d76b;" string="\mathsfbf{\Phi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL PSI-->
    <char character="&#x1d76d;" string="\mathsfbf{\Psi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD CAPITAL OMEGA-->
    <char character="&#x1d76e;" string="\mathsfbf{\Omega}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL ALPHA-->
    <char character="&#x1d770;" string="\mathsfbf{\alpha}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL BETA-->
    <char character="&#x1d771;" string="\mathsfbf{\beta}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL GAMMA-->
    <char character="&#x1d772;" string="\mathsfbf{\gamma}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL DELTA-->
    <char character="&#x1d773;" string="\mathsfbf{\delta}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL EPSILON-->
    <char character="&#x1d774;" string="\mathsfbf{\varepsilon}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL ZETA-->
    <char character="&#x1d775;" string="\mathsfbf{\zeta}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL ETA-->
    <char character="&#x1d776;" string="\mathsfbf{\eta}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL THETA-->
    <char character="&#x1d777;" string="\mathsfbf{\theta}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL IOTA-->
    <char character="&#x1d778;" string="\mathsfbf{\iota}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL KAPPA-->
    <char character="&#x1d779;" string="\mathsfbf{\kappa}"/>
    <!--mathematical sans-serif bold small lambda-->
    <char character="&#x1d77a;" string="\mathsfbf{\lambda}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL MU-->
    <char character="&#x1d77b;" string="\mathsfbf{\mu}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL NU-->
    <char character="&#x1d77c;" string="\mathsfbf{\nu}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL XI-->
    <char character="&#x1d77d;" string="\mathsfbf{\xi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL PI-->
    <char character="&#x1d77f;" string="\mathsfbf{\pi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL RHO-->
    <char character="&#x1d780;" string="\mathsfbf{\rho}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL FINAL SIGMA-->
    <char character="&#x1d781;" string="\mathsfbf{\varsigma}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL SIGMA-->
    <char character="&#x1d782;" string="\mathsfbf{\sigma}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL TAU-->
    <char character="&#x1d783;" string="\mathsfbf{\tau}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL UPSILON-->
    <char character="&#x1d784;" string="\mathsfbf{\upsilon}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL PHI-->
    <char character="&#x1d785;" string="\mathsfbf{\varphi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL CHI-->
    <char character="&#x1d786;" string="\mathsfbf{\chi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL PSI-->
    <char character="&#x1d787;" string="\mathsfbf{\psi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD SMALL OMEGA-->
    <char character="&#x1d788;" string="\mathsfbf{\omega}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD EPSILON SYMBOL-->
    <char character="&#x1d78a;" string="\mathsfbf{\epsilon}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD THETA SYMBOL-->
    <char character="&#x1d78b;" string="\mathsfbf{\vartheta}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD PHI SYMBOL-->
    <char character="&#x1d78d;" string="\mathsfbf{\phi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD RHO SYMBOL-->
    <char character="&#x1d78e;" string="\mathsfbf{\varrho}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD PI SYMBOL-->
    <char character="&#x1d78f;" string="\mathsfbf{\varpi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL GAMMA-->
    <char character="&#x1d792;" string="\mathsfbfit{\Gamma}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL DELTA-->
    <char character="&#x1d793;" string="\mathsfbfit{\Delta}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL THETA-->
    <char character="&#x1d797;" string="\mathsfbfit{\Theta}"/>
    <!--mathematical sans-serif bold italic capital lambda-->
    <char character="&#x1d79a;" string="\mathsfbfit{\Lambda}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL XI-->
    <char character="&#x1d79d;" string="\mathsfbfit{\Xi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL PI-->
    <char character="&#x1d79f;" string="\mathsfbfit{\Pi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL SIGMA-->
    <char character="&#x1d7a2;" string="\mathsfbfit{\Sigma}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL UPSILON-->
    <char character="&#x1d7a4;" string="\mathsfbfit{\Upsilon}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL PHI-->
    <char character="&#x1d7a5;" string="\mathsfbfit{\Phi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL PSI-->
    <char character="&#x1d7a7;" string="\mathsfbfit{\Psi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL OMEGA-->
    <char character="&#x1d7a8;" string="\mathsfbfit{\Omega}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL ALPHA-->
    <char character="&#x1d7aa;" string="\mathsfbfit{\alpha}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL BETA-->
    <char character="&#x1d7ab;" string="\mathsfbfit{\beta}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL GAMMA-->
    <char character="&#x1d7ac;" string="\mathsfbfit{\gamma}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL DELTA-->
    <char character="&#x1d7ad;" string="\mathsfbfit{\delta}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL EPSILON-->
    <char character="&#x1d7ae;" string="\mathsfbfit{\varepsilon}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL ZETA-->
    <char character="&#x1d7af;" string="\mathsfbfit{\zeta}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL ETA-->
    <char character="&#x1d7b0;" string="\mathsfbfit{\eta}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL THETA-->
    <char character="&#x1d7b1;" string="\mathsfbfit{\theta}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL IOTA-->
    <char character="&#x1d7b2;" string="\mathsfbfit{\iota}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL KAPPA-->
    <char character="&#x1d7b3;" string="\mathsfbfit{\kappa}"/>
    <!--mathematical sans-serif bold italic small lambda-->
    <char character="&#x1d7b4;" string="\mathsfbfit{\lambda}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL MU-->
    <char character="&#x1d7b5;" string="\mathsfbfit{\mu}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL NU-->
    <char character="&#x1d7b6;" string="\mathsfbfit{\nu}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL XI-->
    <char character="&#x1d7b7;" string="\mathsfbfit{\xi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL PI-->
    <char character="&#x1d7b9;" string="\mathsfbfit{\pi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL RHO-->
    <char character="&#x1d7ba;" string="\mathsfbfit{\rho}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL FINAL SIGMA-->
    <char character="&#x1d7bb;" string="\mathsfbfit{\varsigma}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL SIGMA-->
    <char character="&#x1d7bc;" string="\mathsfbfit{\sigma}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL TAU-->
    <char character="&#x1d7bd;" string="\mathsfbfit{\tau}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL UPSILON-->
    <char character="&#x1d7be;" string="\mathsfbfit{\upsilon}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL PHI-->
    <char character="&#x1d7bf;" string="\mathsfbfit{\varphi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL CHI-->
    <char character="&#x1d7c0;" string="\mathsfbfit{\chi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL PSI-->
    <char character="&#x1d7c1;" string="\mathsfbfit{\psi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL OMEGA-->
    <char character="&#x1d7c2;" string="\mathsfbfit{\omega}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC EPSILON SYMBOL-->
    <char character="&#x1d7c4;" string="\mathsfbfit{\epsilon}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC THETA SYMBOL-->
    <char character="&#x1d7c5;" string="\mathsfbfit{\vartheta}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC PHI SYMBOL-->
    <char character="&#x1d7c7;" string="\mathsfbfit{\phi}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC RHO SYMBOL-->
    <char character="&#x1d7c8;" string="\mathsfbfit{\varrho}"/>
    <!--MATHEMATICAL SANS-SERIF BOLD ITALIC PI SYMBOL-->
    <char character="&#x1d7c9;" string="\mathsfbfit{\varpi}"/>
    <!--mathematical bold digit 0-->
    <char character="&#x1d7ce;" string="\mathbf{0}"/>
    <!--mathematical bold digit 1-->
    <char character="&#x1d7cf;" string="\mathbf{1}"/>
    <!--mathematical bold digit 2-->
    <char character="&#x1d7d0;" string="\mathbf{2}"/>
    <!--mathematical bold digit 3-->
    <char character="&#x1d7d1;" string="\mathbf{3}"/>
    <!--mathematical bold digit 4-->
    <char character="&#x1d7d2;" string="\mathbf{4}"/>
    <!--mathematical bold digit 5-->
    <char character="&#x1d7d3;" string="\mathbf{5}"/>
    <!--mathematical bold digit 6-->
    <char character="&#x1d7d4;" string="\mathbf{6}"/>
    <!--mathematical bold digit 7-->
    <char character="&#x1d7d5;" string="\mathbf{7}"/>
    <!--mathematical bold digit 8-->
    <char character="&#x1d7d6;" string="\mathbf{8}"/>
    <!--mathematical bold digit 9-->
    <char character="&#x1d7d7;" string="\mathbf{9}"/>
    <!--mathematical double-struck digit 0-->
    <char character="&#x1d7d8;" string="\mathbb{0}"/>
    <!--= \mathds{1} (dsfont), mathematical double-struck digit 1-->
    <char character="&#x1d7d9;" string="\mathbb{1}"/>
    <!--mathematical double-struck digit 2-->
    <char character="&#x1d7da;" string="\mathbb{2}"/>
    <!--mathematical double-struck digit 3-->
    <char character="&#x1d7db;" string="\mathbb{3}"/>
    <!--mathematical double-struck digit 4-->
    <char character="&#x1d7dc;" string="\mathbb{4}"/>
    <!--mathematical double-struck digit 5-->
    <char character="&#x1d7dd;" string="\mathbb{5}"/>
    <!--mathematical double-struck digit 6-->
    <char character="&#x1d7de;" string="\mathbb{6}"/>
    <!--mathematical double-struck digit 7-->
    <char character="&#x1d7df;" string="\mathbb{7}"/>
    <!--mathematical double-struck digit 8-->
    <char character="&#x1d7e0;" string="\mathbb{8}"/>
    <!--mathematical double-struck digit 9-->
    <char character="&#x1d7e1;" string="\mathbb{9}"/>
    <!--mathematical sans-serif digit 0-->
    <char character="&#x1d7e2;" string="\mathsf{0}"/>
    <!--mathematical sans-serif digit 1-->
    <char character="&#x1d7e3;" string="\mathsf{1}"/>
    <!--mathematical sans-serif digit 2-->
    <char character="&#x1d7e4;" string="\mathsf{2}"/>
    <!--mathematical sans-serif digit 3-->
    <char character="&#x1d7e5;" string="\mathsf{3}"/>
    <!--mathematical sans-serif digit 4-->
    <char character="&#x1d7e6;" string="\mathsf{4}"/>
    <!--mathematical sans-serif digit 5-->
    <char character="&#x1d7e7;" string="\mathsf{5}"/>
    <!--mathematical sans-serif digit 6-->
    <char character="&#x1d7e8;" string="\mathsf{6}"/>
    <!--mathematical sans-serif digit 7-->
    <char character="&#x1d7e9;" string="\mathsf{7}"/>
    <!--mathematical sans-serif digit 8-->
    <char character="&#x1d7ea;" string="\mathsf{8}"/>
    <!--mathematical sans-serif digit 9-->
    <char character="&#x1d7eb;" string="\mathsf{9}"/>
    <!--mathematical sans-serif bold digit 0-->
    <char character="&#x1d7ec;" string="\mathsfbf{0}"/>
    <!--mathematical sans-serif bold digit 1-->
    <char character="&#x1d7ed;" string="\mathsfbf{1}"/>
    <!--mathematical sans-serif bold digit 2-->
    <char character="&#x1d7ee;" string="\mathsfbf{2}"/>
    <!--mathematical sans-serif bold digit 3-->
    <char character="&#x1d7ef;" string="\mathsfbf{3}"/>
    <!--mathematical sans-serif bold digit 4-->
    <char character="&#x1d7f0;" string="\mathsfbf{4}"/>
    <!--mathematical sans-serif bold digit 5-->
    <char character="&#x1d7f1;" string="\mathsfbf{5}"/>
    <!--mathematical sans-serif bold digit 6-->
    <char character="&#x1d7f2;" string="\mathsfbf{6}"/>
    <!--mathematical sans-serif bold digit 7-->
    <char character="&#x1d7f3;" string="\mathsfbf{7}"/>
    <!--mathematical sans-serif bold digit 8-->
    <char character="&#x1d7f4;" string="\mathsfbf{8}"/>
    <!--mathematical sans-serif bold digit 9-->
    <char character="&#x1d7f5;" string="\mathsfbf{9}"/>
    <!--mathematical monospace digit 0-->
    <char character="&#x1d7f6;" string="\mathtt{0}"/>
    <!--mathematical monospace digit 1-->
    <char character="&#x1d7f7;" string="\mathtt{1}"/>
    <!--mathematical monospace digit 2-->
    <char character="&#x1d7f8;" string="\mathtt{2}"/>
    <!--mathematical monospace digit 3-->
    <char character="&#x1d7f9;" string="\mathtt{3}"/>
    <!--mathematical monospace digit 4-->
    <char character="&#x1d7fa;" string="\mathtt{4}"/>
    <!--mathematical monospace digit 5-->
    <char character="&#x1d7fb;" string="\mathtt{5}"/>
    <!--mathematical monospace digit 6-->
    <char character="&#x1d7fc;" string="\mathtt{6}"/>
    <!--mathematical monospace digit 7-->
    <char character="&#x1d7fd;" string="\mathtt{7}"/>
    <!--mathematical monospace digit 8-->
    <char character="&#x1d7fe;" string="\mathtt{8}"/>
    <!--mathematical monospace digit 9-->
    <char character="&#x1d7ff;" string="\mathtt{9}"/>
    <!--BELL -->
    <char character="&#x1f514;" string="\bell"/>
  </charmap>  
</xml2tex:set>
  <xsl:variable name="texmap" select="document('')/xml2tex:set/xml2tex:charmap/xml2tex:char" as="element(xml2tex:char)+"/>    
  <xml2tex:textmapgreek xmlns="http://transpect.io/xml2tex">
  <charmap>
      
    <!-- *
         * Upgreek definitions
         * -->
  
    <!--= \Gamma (-slantedGreek), = \mathrm{\Gamma}, capital gamma, greek-->   
    <char character="&#x393;" string="\Upgamma"/>
    <!--= \Delta (-slantedGreek), = \mathrm{\Delta}, capital delta, greek-->
    <char character="&#x394;" string="\Updelta"/>
    <!--= \Theta (-slantedGreek), = \mathrm{\Theta}, capital theta, greek-->
    <char character="&#x398;" string="\Uptheta"/>
    <!--= \Lambda (-slantedGreek), = \mathrm{\Lambda}, capital lambda, greek-->
    <char character="&#x39b;" string="\Uplambda"/>
    <!--= \Xi (-slantedGreek), = \mathrm{\Xi}, capital xi, greek-->
    <char character="&#x39e;" string="\Upxi"/>
    <!--= \Pi (-slantedGreek), = \mathrm{\Pi}, capital pi, greek-->
    <char character="&#x3a0;" string="\Uppi"/>
    <!--= \Sigma (-slantedGreek), = \mathrm{\Sigma}, capital sigma, greek-->
    <char character="&#x3a3;" string="\Upsigma"/>
    <!--= \Upsilon (-slantedGreek), = \mathrm{\Upsilon}, capital upsilon, greek-->
    <char character="&#x3a5;" string="\Upupsilon"/>
    <!--= \Phi (-slantedGreek), = \mathrm{\Phi}, capital phi, greek-->
    <char character="&#x3a6;" string="\Upphi"/>
    <!--= \Psi (-slantedGreek), = \mathrm{\Psi}, capital psi, greek-->
    <char character="&#x3a8;" string="\Uppsi"/>
    <!--= \Omega (-slantedGreek), = \mathrm{\Omega}, capital omega, greek-->
    <char character="&#x3a9;" string="\Upomega"/>
    <!--= \mathrm{\alpha} (omlmathrm), = \alphaup (kpfonts mathdesign), = \upalpha (upgreek),  alpha, greek-->
    <char character="&#x3b1;" string="\upalpha"/>
    <!--= \mathrm{\beta} (omlmathrm), = \betaup (kpfonts mathdesign), = \upbeta (upgreek),  beta, greek-->
    <char character="&#x3b2;" string="\upbeta"/>
    <!--= \mathrm{\gamma} (omlmathrm), = \gammaup (kpfonts mathdesign), = \upgamma (upgreek),  gamma, greek-->
    <char character="&#x3b3;" string="\upgamma"/>
    <!--= \mathrm{\delta} (omlmathrm), = \deltaup (kpfonts mathdesign), = \updelta (upgreek),  delta, greek-->
    <char character="&#x3b4;" string="\updelta"/>
    <!--= \mathrm{\varepsilon} (omlmathrm), = \varepsilonup (kpfonts mathdesign), rounded = \upepsilon (upgreek),  epsilon, greek-->
    <char character="&#x3b5;" string="\upvarepsilon"/>
    <!--= \mathrm{\zeta} (omlmathrm), = \zetaup (kpfonts mathdesign), = \upzeta (upgreek),  zeta, greek-->
    <char character="&#x3b6;" string="\upzeta"/>
    <!--= \mathrm{\eta} (omlmathrm), = \etaup (kpfonts mathdesign), = \upeta (upgreek),  eta, greek-->
    <char character="&#x3b7;" string="\upeta"/>
    <!--= \mathrm{\theta} (omlmathrm), = \thetaup (kpfonts mathdesign), straight theta, = \uptheta (upgreek),  theta, greek-->
    <char character="&#x3b8;" string="\uptheta"/>
    <!--= \mathrm{\iota} (omlmathrm), = \iotaup (kpfonts mathdesign), = \upiota (upgreek),  iota, greek-->
    <char character="&#x3b9;" string="\upiota"/>
    <!--= \mathrm{\kappa} (omlmathrm), = \kappaup (kpfonts mathdesign), = \upkappa (upgreek),  kappa, greek-->
    <char character="&#x3ba;" string="\upkappa"/>
    <!--= \mathrm{\lambda} (omlmathrm), = \lambdaup (kpfonts mathdesign), = \uplambda (upgreek),  lambda, greek-->
    <char character="&#x3bb;" string="\uplambda"/>
    <!--= \mathrm{\mu} (omlmathrm), = \muup (kpfonts mathdesign), = \upmu (upgreek),  mu, greek-->
    <char character="&#xb5;" string="\upmu"/>
    <char character="&#x3bc;" string="\upmu"/>
    <!--= \mathrm{\nu} (omlmathrm), = \nuup (kpfonts mathdesign), = \upnu (upgreek),  nu, greek-->
    <char character="&#x3bd;" string="\upnu"/>
    <!--= \mathrm{\xi} (omlmathrm), = \xiup (kpfonts mathdesign), = \upxi (upgreek),  xi, greek-->
    <char character="&#x3be;" string="\upxi"/>
    <!--= \mathrm{\pi} (omlmathrm), = \piup (kpfonts mathdesign), = \uppi (upgreek),  pi, greek-->
    <char character="&#x3c0;" string="\uppi"/>
    <!--= \mathrm{\rho} (omlmathrm), = \rhoup (kpfonts mathdesign), = \uprho (upgreek),  rho, greek-->
    <char character="&#x3c1;" string="\uprho"/>
    <!--= \mathrm{\varsigma} (omlmathrm), = \varsigmaup (kpfonts mathdesign), terminal sigma, greek-->
    <char character="&#x3c2;" string="\upvarsigma"/>
    <!--= \mathrm{\sigma} (omlmathrm), = \sigmaup (kpfonts mathdesign), = \upsigma (upgreek),  sigma, greek-->
    <char character="&#x3c3;" string="\upsigma"/>
    <!--= \mathrm{\tau} (omlmathrm), = \tauup (kpfonts mathdesign), = \uptau (upgreek),  tau, greek-->
    <char character="&#x3c4;" string="\uptau"/>
    <!--= \mathrm{\upsilon} (omlmathrm), = \upsilonup (kpfonts mathdesign), = \upupsilon (upgreek),  upsilon, greek-->
    <char character="&#x3c5;" string="\upupsilon"/>
    <!--= \mathrm{\varphi} (omlmathrm), = \varphiup (kpfonts mathdesign), curly or open = \upvarphi (upgreek),  phi, greek-->
    <char character="&#x3c6;" string="\upvarphi"/>
    <!--= \mathrm{\chi} (omlmathrm), = \chiup (kpfonts mathdesign), = \upchi (upgreek),  chi, greek-->
    <char character="&#x3c7;" string="\upchi"/>
    <!--= \mathrm{\psi} (omlmathrm), = \psiup (kpfonts mathdesign), = \uppsi (upgreek),  psi, greek-->
    <char character="&#x3c8;" string="\uppsi"/>
    <!--= \mathrm{\omega} (omlmathrm), = \omegaup (kpfonts mathdesign), = \upomega (upgreek),  omega, greek-->
    <char character="&#x3c9;" string="\upomega"/>
    <!--rounded = \upvarbeta (upgreek),  beta, greek-->
    <char character="&#x3d0;" string="\upvarbeta"/>
    <!--= \mathrm{\vartheta} (omlmathrm), = \varthetaup (kpfonts mathdesign), curly or open theta-->
    <char character="&#x3d1;" string="\upvartheta"/>
    <!--= \mathrm{\phi} (omlmathrm), = \phiup (kpfonts mathdesign), GREEK PHI SYMBOL (straight)-->
    <char character="&#x3d5;" string="\upphi"/>
    <!--= \mathrm{\varpi} (omlmathrm), = \varpiup (kpfonts mathdesign), GREEK PI SYMBOL (pomega)-->
    <char character="&#x3d6;" string="\upvarpi"/>
    <!--= \mathrm{\varrho} (omlmathrm), = \varrhoup (kpfonts mathdesign), GREEK RHO SYMBOL (round)-->
    <char character="&#x3f1;" string="\upvarrho"/>
    <!--= \mathrm{\epsilon} (omlmathrm), = \epsilonup (kpfonts mathdesign), GREEK LUNATE EPSILON SYMBOL-->
    <char character="&#x3f5;" string="\upepsilon"/>
    <!-- APL FUNCTIONAL SYMBOL ALPHA -->
    <char character="&#x237a;" string="\upalpha"/>
  </charmap>
</xml2tex:textmapgreek>
  
  <xsl:variable name="texmap-upgreek" select="document('')/xml2tex:textmapgreek/xml2tex:charmap/xml2tex:char" as="element(xml2tex:char)+"/>
  
  <xsl:variable name="texregex" select="concat('[', string-join(for $i in $texmap/@character return functx:escape-for-regex($i), ''), ']')" as="xs:string"/>

  <xsl:variable name="texregex-upgreek" select="concat('^[', string-join(for $i in $texmap-upgreek/@character return functx:escape-for-regex($i), ''), ']+$')" as="xs:string"/>

  <xsl:variable name="diacritics-regex" select="'^[&#x300;-&#x338;&#x20d0;-&#x20ef;]$'" as="xs:string"/>
  
  <xsl:variable name="parenthesis-regex" select="'[\[\]\(\){}&#x2308;&#x2309;&#x230a;&#x230b;&#x2329;&#x232a;&#x27e8;&#x27e9;&#x3008;&#x3009;]'" as="xs:string"/>
  
  <xsl:variable name="whitespace-regex" select="'\p{Zs}&#x200b;-&#x200f;'" as="xs:string"/>
    <xsl:function name="tr:menclose-to-latex" as="xs:string+">
    <xsl:param name="notation" as="attribute(notation)"/>
    <xsl:sequence select="if($notation = ('box', 'roundedbox'))  then ('\boxed{',      '}')
                      else if($notation eq 'updiagonalstrike')   then ('\cancel{',     '}')
                      else if($notation eq 'downdiagonalstrike') then ('\bcancel{',    '}')
                      else if($notation eq 'updiagonalarrow')    then ('\cancelto{}',  '}')
                      else if($notation eq 'top')                then ('\overline{',   '}')
                      else if($notation eq 'underline')          then ('\underline{',  '}')
                      else if($notation eq 'left')               then ('\left|',       '\right.')
                      else if($notation eq 'right')              then ('\left.',       '\right|')
                      else if($notation eq 'radical')            then ('\sqrt{',       '}')
                      else                                            (concat('\', $notation, '{'), '}')"/>
  </xsl:function>
  <xsl:function name="mml2tex:max-col-count" as="xs:integer">
    <xsl:param name="mtable" as="element(mtable)"/>
    <xsl:value-of select="max(for $i in $mtable/mtr return count(($i/mtd, $i//malignmark)))"/>
  </xsl:function>
 
  <xsl:function name="mml2tex:utf2tex" as="xs:string*">
    <xsl:param name="string" as="xs:string"/>
    <!-- In order to avoid infinite recursion when mapping % → \% -->
    <xsl:param name="seen" as="xs:string*"/>
    <xsl:param name="texmap" as="element(xml2tex:char)+"/>
    <xsl:variable name="texregex" select="concat('[', 
                                                 string-join(for $i in $texmap/@character 
                                                             return functx:escape-for-regex($i), ''), 
                                                 ']')" as="xs:string"/>
    <xsl:analyze-string select="$string" regex="{$texregex}">

      <xsl:matching-substring>
        <xsl:variable name="pattern" select="functx:escape-for-regex(.)" as="xs:string"/>
        <xsl:variable name="replacement" select="replace($texmap[matches(@character, $pattern)][1]/@string, '(\$|\\)', '\\$1')" as="xs:string"/>
        <xsl:variable name="insert-whitespace" select="if(matches($replacement, '[\(\)\[\]\{\},;\.&quot;''\?!]$')) 
                                                       then ()
                                                       else '&#x20;'" as="xs:string?"/>
        <xsl:variable name="result" select="replace(., 
                                                    $pattern,
                                                    concat($replacement, $insert-whitespace)
                                                    )" as="xs:string"/>
        <xsl:choose>
          <xsl:when test="matches($result, $texregex)
                          and not(($pattern = $seen) or matches($result, '^[-,\.\^a-z0-9A-Z\$\\%_&amp;\{{\}}\[\]#\|\s~&quot;]+$'))">
            <xsl:value-of select="string-join(mml2tex:utf2texrec($result, ($seen, $pattern), $texmap), '')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$result"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:matching-substring>
      <xsl:non-matching-substring>
        <xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </xsl:function>
  <xsl:function name="mml2tex:utf2texrec" as="xs:string*">
    <xsl:param name="string" as="xs:string"/>
    <!-- In order to avoid infinite recursion when mapping % → \% -->
    <xsl:param name="seen" as="xs:string*"/>
    <xsl:param name="texmap" as="element(xml2tex:char)+"/>
    <xsl:value-of select="string-join(mml2tex:utf2tex($string, $seen, $texmap), '')"/>
  </xsl:function>
  
  <xsl:function name="functx:escape-for-regex" as="xs:string">
    <xsl:param name="arg" as="xs:string?"/> 
    <xsl:sequence select="replace($arg,
                                  '(\.|\[|\]|\\|\||\-|\^|\$|\?|\*|\+|\{|\}|\(|\))','\\$1')"/>
  </xsl:function>

  <xsl:template match="*" mode="mathml2tex" priority="-10">
    <xsl:message terminate="{$fail-on-error}" select="'[ERROR]: unknown element', name()"/>    
  </xsl:template>

  <xsl:template match="@*" mode="mathml2tex">
    <xsl:message terminate="{$fail-on-error}" select="'[ERROR]: unknown attribute', name()"/>
  </xsl:template>

  <xsl:template match="math" mode="mathml2tex">
    <xsl:variable name="basic-transformation">
      <xsl:apply-templates select="@display, node()" mode="#current"/>
    </xsl:variable>
    <xsl:value-of select="$basic-transformation"/>
  </xsl:template>

  <xsl:template match="math/@display" mode="mathml2tex">
    <xsl:if test="$set-math-style = 'yes'">
      <xsl:choose>
        <xsl:when test=". = 'inline'">
          <xsl:text>\textstyle </xsl:text>
        </xsl:when>
        <xsl:when test=". = 'block'">
          <xsl:text>\displaystyle </xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:message
            select="'[WARNING]: attribute', name(), 'in', ../name(), 'must be ''inline'' or ''block''! Was:', ."/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template match="semantics" mode="mathml2tex">
    <xsl:apply-templates select="@*, node()" mode="#current"/>
  </xsl:template>

  <!-- drop attributes and elements -->
  <xsl:template match="@overflow[parent::math]
                      |@movablelimits[parent::mo]
                      |@mathcolor
                      |@color
                      |@fontsize
                      |@mathsize
                      |@mathbackground
                      |@background
                      |@maxsize
                      |@minsize
                      |@scriptminsize
                      |@fence
                      |@stretchy
                      |@separator
                      |@accent
                      |@accentunder
                      |@form
                      |@largeop
                      |@lspace
                      |@rspace
                      |@columnalign[parent::mtable]
                      |@align[parent::mtable]
                      |@accent
                      |@accentunder
                      |@form
                      |@largeop
                      |@lspace
                      |@rspace
                      |@linebreak
                      |@symmetric[parent::mo]
                      |@columnspacing
                      |@rowspacing
                      |@columnalign
                      |@groupalign
                      |@columnwidth
                      |@rowalign
                      |@displaystyle
                      |@scriptlevel[parent::mstyle]
                      |@linethickness[parent::mstyle]
                      |@columnlines
                      |@rowlines
                      |@equalcolumns
                      |@equalrows
                      |@frame
                      |@framespacing
                      |@rowspan
                      |@class
                      |@side" mode="mathml2tex">
    <xsl:message select="'[WARNING]: attribute', name(), 'in context', ../name(), 'ignored!'"/>
  </xsl:template>
  
  <xsl:template match="mphantom|maligngroup" mode="mathml2tex">
    <xsl:message select="'[WARNING]: element', name(), 'ignored!'"/>
  </xsl:template>
  
  <!-- https://github.com/transpect/mml2tex/issues/3 -->
  
  <xsl:template match="malignmark|maligngroup[position() ne 1]" mode="mathml2tex">
    <!-- consider that the stylesheet which imports mm2ltex.xsl must 
         wrap the equation with an align environment -->
    <xsl:text>&#x20;&amp;&#x20;</xsl:text>
  </xsl:template>
  
  <!-- resolve elements -->
  
  <xsl:template match="mlabeledtr|maction|mrow|merror|mpadded" mode="mathml2tex">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>

  <xsl:template match="mspace[@width]" mode="mathml2tex">
    <xsl:variable name="width" select="xs:decimal(replace(@width, '[a-z]+', ''))" as="xs:decimal"/>
    <xsl:variable name="mu-width" select="$width * 18" as="xs:decimal"/>
    <!-- 1 mu = 1/18em, MathML authors are encouraged to use em as unit here -->
    <xsl:variable name="tex-mwidth" select="if($mu-width &gt;= 36)  then '\qquad '  (: twice of \quad (= 36 mu):)
                                       else if($mu-width &gt;= 18)  then '\quad '   (: 1 mu :)
                                       else if($mu-width &gt;= 9)   then '\ '       (: equivalent of space in normal text :)
                                       else if($mu-width &gt;= 5)   then '\;'       (: 5/18 of \quad (= 5 mu) :)
                                       else if($mu-width &gt;= 4)   then '\:'       (: 4/18 of \quad (= 3 mu) :)
                                       else if($mu-width &lt; 4)    then '\,'       (: 3/18 of \quad (= 3 mu) :)
                                       else '\ '"/>
    <xsl:choose>
      <xsl:when test="@width">
        <xsl:apply-templates select="@* except (@width, @height, @depth)" mode="#current"/>
        <xsl:apply-templates mode="#current"/>
        <xsl:value-of select="$tex-mwidth"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="@* except (@width, @height, @depth)" mode="#current"/>
        <xsl:apply-templates mode="#current"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="mspace[@linebreak]" mode="mathml2tex">
    <xsl:if test="@linebreak eq 'newline'">
      <xsl:text> \\&#xa;</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="menclose" mode="mathml2tex">
    <xsl:value-of select="tr:menclose-to-latex(@notation)[1]"/>
    <xsl:apply-templates mode="#current"/>
    <xsl:value-of select="tr:menclose-to-latex(@notation)[2]"/>
  </xsl:template>
  
  

  <xsl:template match="mfrac" mode="mathml2tex">
    <xsl:text>\frac</xsl:text>
    <xsl:apply-templates select="@*[not(local-name() = ('linethickness', 'bevelled'))]" mode="#current"/>
    <xsl:choose>
      <xsl:when test="count(*) eq 2">
        <xsl:text>{</xsl:text>
        <xsl:apply-templates select="*[1]" mode="#current"/>
        <xsl:text>}{</xsl:text>
        <xsl:apply-templates select="*[2]" mode="#current"/>
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message terminate="{$fail-on-error}" select="name(), 'must include two elements', 'context:&#xa;', ."/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="mmultiscripts" mode="mathml2tex">
    <!-- 
      the tensor command relies on the same-named LaTeX package
      https://www.ctan.org/pkg/tensor
    -->
    <xsl:text>\tensor*[</xsl:text>
    <!-- pre -->
    <xsl:for-each-group select="node()" group-by="preceding-sibling::mprescripts">
      <xsl:for-each select="current-group()">
        <xsl:call-template name="apply-superscript-or-subscript"/>
      </xsl:for-each>
    </xsl:for-each-group>
    <!-- base -->
    <xsl:text>]{</xsl:text>
    <xsl:apply-templates select="*[1]" mode="#current"/>
    <xsl:text>}{</xsl:text>
    <!-- post -->
    <xsl:for-each-group select="node()[not(position() eq 1)]" group-by="following-sibling::mprescripts">  
      <xsl:for-each select="current-group()">
        <xsl:call-template name="apply-superscript-or-subscript"/>
      </xsl:for-each>
    </xsl:for-each-group>
    <xsl:text>}</xsl:text>
  </xsl:template>
  
  <xsl:template name="apply-superscript-or-subscript">
    <xsl:choose>
      <xsl:when test="position() mod 2 eq 0">
        <xsl:text>^{</xsl:text>
        <xsl:apply-templates mode="#current"/>
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:when test="position() mod 2 eq 1">
        <xsl:text>_{</xsl:text>
        <xsl:apply-templates mode="#current"/>
        <xsl:text>}</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="msqrt" mode="mathml2tex">
    <xsl:text>\sqrt{</xsl:text>
    <xsl:apply-templates mode="#current"/>
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="mroot" mode="mathml2tex">
    <xsl:if test="count(*) ne 2">
      <xsl:message terminate="{$fail-on-error}" select="name(), 'must include two elements', 'context:&#xa;', ancestor::math[1]"/>
    </xsl:if>
    <xsl:text>\sqrt</xsl:text>
    <!-- index (optional) -->
    <xsl:if test="*[2]/node()">
      <xsl:text>[</xsl:text>  
      <xsl:apply-templates select="*[2]" mode="#current"/>
      <xsl:text>]</xsl:text>
    </xsl:if>
    <!-- radicand -->
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="*[1]" mode="#current"/>
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="msup|msub" mode="mathml2tex">
    <xsl:if test="count(*) ne 2">
      <xsl:message terminate="{$fail-on-error}" select="name(), 'must include two elements', 'context:&#xa;', ancestor::math[1]"/>
    </xsl:if>
    <xsl:if test="parent::msub | parent::msup | parent::mrow/(parent::msub, parent::msup)">{</xsl:if>
    <xsl:apply-templates select="*[1]" mode="#current"/>
    <xsl:value-of select="if (local-name(.) eq 'msup') then '^' else '_'"/>
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="*[2]" mode="#current"/>
    <xsl:text>}</xsl:text>
    <xsl:if test="parent::msub | parent::msup | parent::mrow/(parent::msub, parent::msup)">}</xsl:if>
  </xsl:template>
  
  <!-- primes, such as y'' -->
  
  <xsl:template match="msup[mi[1] and *[2] and matches(*[2], '^[''&#x2032;&#x2033;&#x2034;]$')]" mode="mathml2tex">
    <xsl:if test="count(*) ne 2">
      <xsl:message terminate="{$fail-on-error}" select="name(), 'must include two elements', 'context:&#xa;', ancestor::math[1]"/>
    </xsl:if>
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:variable name="integrals-sums-and-limits" as="xs:string+" 
                select="'&#x220f;', 
                        '&#x2210;', 
                        '&#x2211;', 
                        '&#x222b;',
                        '&#x222c;',
                        '&#x222d;',
                        '&#x222e;',
                        '&#x222f;',
                        '&#x2230;',
                        '&#x22c0;', 
                        '&#x22c1;', 
                        '&#x22c2;', 
                        '&#x22c3;', 
                        'lim', 
                        'max', 
                        'min'"/>

  <xsl:template match="msubsup|munderover[*[1] = $integrals-sums-and-limits]" mode="mathml2tex">
    <xsl:if test="count(*) ne 3">
      <xsl:message terminate="{$fail-on-error}" select="name(), 'must include three elements', 'context:&#xa;', ancestor::math[1]"/>
    </xsl:if>
    <xsl:variable name="base">
      <xsl:apply-templates select="*[1]" mode="#current"/>
    </xsl:variable>
    <xsl:if test="matches($base, '^.*_\{[^}]*\}+$')">
      <xsl:text>{</xsl:text>
    </xsl:if>
    <xsl:sequence select="$base"/>
    <xsl:if test="matches($base, '^.*_\{[^}]*\}+$')">
      <xsl:text>}</xsl:text>
    </xsl:if>
    <xsl:text>_{</xsl:text>
    <xsl:apply-templates select="*[2]" mode="#current"/>
    <xsl:text>}^{</xsl:text>
    <xsl:apply-templates select="*[3]" mode="#current"/>
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="mtable" mode="mathml2tex">
    <xsl:variable name="mcc" select="mml2tex:max-col-count(.)" as="xs:integer"/>
    <xsl:variable name="columnlines" select="tokenize(@columnlines, '\s')" as="xs:string*"/>
    <xsl:variable name="col-aligns" select="for $i in mtr[count((mtd, .//malignmark)) &gt;= $mcc]
                                            return ($i/mtd/ancestor-or-self::*[@columnalign]/@columnalign, 
                                                    $i/mtd/ancestor-or-self::*[@groupalign]/@groupalign, 
                                                    'center')[1]" as="xs:string*"/>
    <xsl:text>\begin{array}{</xsl:text>
    <xsl:for-each select="1 to $mcc">
      <xsl:variable name="pos" select="min((count($col-aligns), position()))" as="xs:integer"/>
      <xsl:value-of select="substring($col-aligns[$pos], 1, 1)"/>
      <xsl:choose>
        <xsl:when test="$columnlines[$pos] eq 'dashed'">
          <xsl:text>:</xsl:text>
        </xsl:when>
        <xsl:when test="$columnlines[$pos] eq 'solid'">
          <xsl:text>|</xsl:text>
        </xsl:when>
        <xsl:otherwise/>
      </xsl:choose>
    </xsl:for-each>
    <xsl:text>}&#xa;</xsl:text>
    <xsl:apply-templates select="@* except @width" mode="#current"/>
    <xsl:apply-templates mode="#current"/>
    <xsl:text>\end{array}</xsl:text>
  </xsl:template>
  
  
  <xsl:template match="mtr" mode="mathml2tex">
    <xsl:variable name="position" select="count(preceding-sibling::mtr) + 1" as="xs:integer"/>
    <xsl:variable name="rowlines" select="tokenize(parent::mtable/@rowlines, '\s')" as="xs:string*"/>
    <xsl:apply-templates select="@*, node()" mode="#current"/>
    <xsl:if test="following-sibling::mtr">
      <xsl:text>\\</xsl:text>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="$rowlines[$position] = 'solid'">
        <xsl:text>&#xa;\hline&#xa;</xsl:text>  
      </xsl:when>
      <xsl:when test="$rowlines[$position] = 'dashed'">
         <xsl:message select="'[WARNING]: arydshln package is needed to draw dashed lines in arrays'"/>
        <xsl:text>&#xa;\hdashline&#xa;</xsl:text>  
      </xsl:when>
    </xsl:choose>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>

  <xsl:template match="mtd" mode="mathml2tex">
    <xsl:apply-templates select="@*, node()" mode="#current"/>
    <xsl:if test="following-sibling::mtd">
      <xsl:text> &amp; </xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="mover|munder" mode="mathml2tex">
    <xsl:if test="count(*) ne 2">
      <xsl:message terminate="{$fail-on-error}" select="name(), 'must include two elements', 'context:&#xa;', ancestor::math[1]"/>
    </xsl:if>
    <!-- diacritical mark overline should be substituted with latex overline -->
    <xsl:variable name="expression" select="*[1]" as="element(*)"/>
    <xsl:variable name="accent" select="*[2]" as="element(*)"/>
    <xsl:variable name="is-diacritical-mark" select="matches($accent, $diacritics-regex) 
                                                     (:and (not(matches($accent, '&#xaf;') and self::munder))  :)" as="xs:boolean"/>
    <xsl:choose>
      <xsl:when test="$accent = ('&#x23de;', '&#x23df;', '&#xfe37;', '&#xfe38;')">
        <xsl:value-of select="if(self::mover) then '\overbrace' else '\underbrace'"/>
      </xsl:when>
      <xsl:when test="$accent = ('&#x23b4;', '&#x23b5;', '&#xfe47;', '&#xfe48;')">
        <xsl:value-of select="if(self::mover) then '\overbracket' else '\underbracket'"/>
      </xsl:when>
      <xsl:when test="$accent eq '&#x5e;' and self::mover"><!-- superscript circumflex/caret -->
        <xsl:value-of select="if(string-length($expression) gt 1) then '\widehat' else '\hat'"/>
      </xsl:when>
      <xsl:when test="$accent eq '&#x7e;' and self::mover"><!-- superscript tilde -->
        <xsl:value-of select="if(string-length($expression) gt 1) then '\widetilde' else '\tilde'"/>
      </xsl:when>
      <xsl:when test="$accent eq '&#x2d9;' and self::mover"><!-- \dot -->
        <xsl:value-of select="'\dot'"/>
      </xsl:when>
      <xsl:when test="$accent eq '&#xa8;' and self::mover"><!-- \ddot -->
        <xsl:value-of select="'\ddot'"/>
      </xsl:when>
      <xsl:when test="$accent eq '&#xb4;' and self::mover"><!-- acute accent -->
        <xsl:value-of select="'\acute'"/>
      </xsl:when>
      <xsl:when test="$accent eq '&#x2d8;' and self::mover"><!-- breve accent -->
        <xsl:value-of select="'\breve'"/>
      </xsl:when>
      <xsl:when test="matches($accent, '^[&#xaf;&#x5f;&#x304;&#x305;&#x203e;]$')"><!-- macron, combining macron, combining overline -->
        <xsl:value-of select="if(self::mover ) then '\overline' else '\underline'"/>
      </xsl:when>
      <xsl:when test="$is-diacritical-mark">
        <xsl:apply-templates select="$accent" mode="#current"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="if(self::mover ) then '\overset{' else '\underset{'"/>
        <xsl:apply-templates select="$accent" mode="#current"/>
        <xsl:text>}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="$expression" mode="#current"/>
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="munderover" mode="mathml2tex">
    <xsl:if test="count(*) ne 3">
      <xsl:message terminate="{$fail-on-error}" select="name(), 'must include three elements', 'context:&#xa;', ancestor::math[1]"/>
    </xsl:if>
    <xsl:text>\overset{</xsl:text>
    <xsl:apply-templates select="*[3]" mode="#current"/>
    <xsl:text>}{\underset{</xsl:text>
    <xsl:apply-templates select="*[2]" mode="#current"/>
    <xsl:text>}</xsl:text>
    <xsl:apply-templates select="*[1]" mode="#current"/>
    <xsl:text>}</xsl:text>
  </xsl:template>
  
  <xsl:template match="mover[*[1] = $integrals-sums-and-limits]
                      |munder[*[1] = $integrals-sums-and-limits]" mode="mathml2tex">
    <xsl:if test="count(*) ne 2">
      <xsl:message terminate="{$fail-on-error}" select="name(), 'must include two elements', 'context:&#xa;', ancestor::math[1]"/>
    </xsl:if>
    <xsl:apply-templates select="*[1]" mode="#current"/>
    <xsl:value-of select="concat(if(self::mover) then '^' else '_', '{')"/>
    <xsl:apply-templates select="*[2]" mode="#current"/>
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="mfenced[count(mrow/mtable) = 1]
                              [count(*) = 1]
                              [@open = '{']
                              [@close = '']"
                mode="mathml2tex">
    <xsl:apply-templates select="mrow/*[following-sibling::mtable]" mode="#current"/>
    <xsl:text>\begin{cases}
    </xsl:text>
    <xsl:apply-templates select="mrow/mtable/mtr" mode="#current"/>
    <xsl:text>\end{cases}
    </xsl:text>
    <xsl:apply-templates select="mrow/*[preceding-sibling::mtable]" mode="#current"/>
  </xsl:template>
  
  <!-- https://github.com/transpect/mml2tex/issues/1, requires amsmath -->
  
  <xsl:template match="mfenced[count(*) eq 1][count(mrow) eq 1][mrow/mfrac[@linethickness = ('0', '0pt')]][count(mrow/mfrac/mrow) eq 2]" mode="mathml2tex">
    <xsl:text>\binom{</xsl:text>
    <xsl:apply-templates select="mrow/mfrac/mrow[1]" mode="#current"/>
    <xsl:text>}{</xsl:text>
    <xsl:apply-templates select="mrow/mfrac/mrow[2]" mode="#current"/>
    <xsl:text>}</xsl:text>
  </xsl:template>
  

  <xsl:template match="mfenced" mode="mathml2tex">
    <xsl:call-template name="fence">
      <xsl:with-param name="pos" select="'left'"/>
      <xsl:with-param name="val" select="(@open, '(')[1]"/>
    </xsl:call-template>
    <xsl:variable name="my-seps" select="replace(@separators, '\s+', '')"/>
    <xsl:variable name="seps" select="if(not(@separators))
                                        then ',' (: mathml spec: comma if @separators didn't exist :)
                                      else if(normalize-space(@separators)) 
                                        then for $x in (1 to string-length($my-seps)) return substring($my-seps, $x, 1)
                                      else '' (: empty @separators is ignored :)" as="xs:string*"/>
    <xsl:variable name="els" select="*"/>
    <xsl:for-each select="1 to count($els)">
      <xsl:if test="current() &gt; 1">
        <xsl:value-of select="if (empty($seps[current() - 1])) then $seps[last()] else $seps[current() - 1]"/>
      </xsl:if>
      <xsl:apply-templates select="$els[current()]" mode="#current"/>
    </xsl:for-each>
    <xsl:call-template name="fence">
      <xsl:with-param name="pos" select="'right'"/>
      <xsl:with-param name="val" select="(@close, ')')[1]"/>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="fence">
    <xsl:param name="pos" as="xs:string"/><!-- left|right -->
    <xsl:param name="val" as="xs:string"/>
    <xsl:choose>
      <xsl:when test="not(normalize-space($val))">
        <xsl:value-of select="concat('\', $pos, '.')"/>
      </xsl:when>
      <xsl:when test="$val = ('[', ']', '(', ')')">
        <xsl:value-of select="concat('\', $pos, $val)"/>
      </xsl:when>
      <xsl:when test="$val = ('{', '}')">
        <xsl:value-of select="concat('\', $pos, '\', $val)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="concat('\', $pos, string-join(mml2tex:utf2tex($val, (), $texmap), ''), '&#x20;')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="text()" mode="mathml2tex">
    <!-- normalize space and remove line breaks -->
    <xsl:variable name="text" select="replace(normalize-space(.), '&#xa;+', ' ')" as="xs:string"/>
    <xsl:variable name="utf2tex" select="string-join(mml2tex:utf2tex($text, (), $texmap), '')" as="xs:string"/>
    <xsl:choose>
      <!-- parenthesis, brackets, e.g. -->
      <xsl:when test="parent::mo and matches(., $parenthesis-regex) 
                      and ($always-use-left-right = 'yes' 
                           or ($always-use-left-right = 'auto' and ancestor::math[@display eq 'block']))">
        <xsl:call-template name="fence">
          <xsl:with-param name="pos" select="if(matches(., '[\[\({&#x2308;&#x230a;&#x2329;&#x27e8;&#x3009;]')) then 'left' else 'right'"/>
          <xsl:with-param name="val" select="."/>
        </xsl:call-template>
      </xsl:when>
      <!-- function names such as cos, sin, log -->
      <xsl:when test="$text = $mml2tex:function-names">
        <xsl:value-of select="concat('\', $text, '&#x20;')"/>
      </xsl:when>
      <!-- regular greeks are rendered with upgreek package -->
      <xsl:when test="parent::mi[@mathvariant eq 'normal' 
                                 or 
                                 (
                                   empty(@mathvariant) 
                                   and 
                                   string-length(.) gt 1
                                 )]
                                 [matches(normalize-space(.), $texregex-upgreek)]
                     |parent::mtext[matches(normalize-space(.), $texregex-upgreek)]">
        <xsl:variable name="utf2tex-upgreek" select="if(. = ' ') then '\ ' 
                                                     else if(matches($text, $texregex-upgreek)) then string-join(mml2tex:utf2tex($text, (), $texmap-upgreek), '')
                                                     else $text" as="xs:string"/>
        <xsl:value-of select="$utf2tex-upgreek"/>
      </xsl:when>
      <xsl:when test="parent::mn
                     |parent::mi
                     |parent::mo
                     |parent::ms">
        <xsl:value-of select="$utf2tex"/>
      </xsl:when>
      <!-- you need to apply mml-normalize.xsl previously. this ensures that some wrong mtext 
           structures are dissolved and more appropriate elements are applied. Otherwise you could 
           note that functions, variables or numbers are just treated as regular text. This is often caused 
           by an improper use of Math editors by authors. -->
      <xsl:when test="parent::mtext">
        <xsl:value-of select="string-join(mml2tex:utf2tex(., (), $texmap), '')"/>
      </xsl:when>
      <!-- render whitespace as single space -->
      <xsl:when test="matches(., '^\s*$')">
        <xsl:text>&#x20;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message select="'[WARNING]: unprocessed or empty text node', ."/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:function name="mml2tex:text-atts" as="xs:string?">
    <xsl:param name="elt" as="element(*)"/>
    <xsl:param name="target" as="xs:string"/>
    <xsl:variable name="fontweight" select="$elt/@fontweight" as="attribute(fontweight)?"/>
    <xsl:variable name="fontstyle" select="$elt/@fontstyle" as="attribute(fontstyle)?"/>
    <xsl:variable name="mathvariant" select="$elt/@mathvariant" as="attribute(mathvariant)?"/>
    <xsl:choose>
      <xsl:when test="$fontweight = 'bold' and $fontstyle = 'italic' and not(matches($mathvariant, 'bold|normal'))">
        <xsl:sequence select="concat('\', $target, 'bi', '{')"/>
      </xsl:when>
      <xsl:when test="$fontweight = 'bold' and not(matches($mathvariant, 'bold|normal'))">
        <xsl:sequence select="concat('\', $target, 'bf', '{')"/>
      </xsl:when>
      <xsl:when test="$fontstyle = 'italic' and not(matches($mathvariant, 'italic|normal'))">
        <xsl:sequence select="concat('\', $target, 'it', '{')"/>
      </xsl:when>
    </xsl:choose>
  </xsl:function>
  
  <xsl:function name="mml2tex:style-to-tex" as="item()*">
    <xsl:param name="elt" as="element()"/>
    <xsl:variable name="mathvariant" select="$elt/@mathvariant" as="attribute(mathvariant)?"/>
    <xsl:variable name="fontstyle"   select="$elt/@fontstyle"   as="attribute(fontstyle)?"/>
    <xsl:variable name="fontweight"  select="$elt/@fontweight"  as="attribute(fontweight)?"/>
    <xsl:variable name="style-map" as="element(mml2tex:styles)">
      <styles xmlns="http://transpect.io/mml2tex">
        <var mml="normal"                 tex="rm"        targets="math"/>
        <var mml="bold"                   tex="bf"        targets="math text"/>
        <var mml="italic"                 tex="it"        targets="math text"/>
        <var mml="bold-italic"            tex="boldsymbol it" targets="math text"/>
        <var mml="mml2tex_bold-italic"    tex="boldsymbol" targets="math"/>
        <var mml="fraktur"                tex="frak"      targets="math text"/>
        <var mml="bold-fraktur"           tex="mathfrak"  targets="math text"/>
        <var mml="script"                 tex="cal"       targets="math text"/>
        <var mml="bold-script"            tex="boldsymbol cal"    targets="math text"/>
        <var mml="sans-serif"             tex="boldsymbol sf"     targets="math text"/>
        <var mml="bold-sans-serif"        tex="boldsymbol sf"     targets="math text"/>
        <var mml="sans-serif-italic"      tex="boldsymbol it sf"  targets="math text"/>
        <var mml="sans-serif-bold-italic" tex="boldsymbol it sf"  targets="math text"/>
        <var mml="double-struck"          tex="bb"        targets="math"/>
        <var mml="monospace"              tex="tt"        targets="math text"/>
      </styles>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="matches($elt, concat('^[', $whitespace-regex, ']+$')) 
                      or ($elt[not(node())])">
        <xsl:apply-templates select="$elt/node()" mode="mathml2tex"/>
      </xsl:when>
      <xsl:when test="(($elt/self::mtext and not($mathvariant))
                        or ($elt/self::mi and $mathvariant eq 'normal'))
                      and matches($elt, $texregex-upgreek)">
        <xsl:apply-templates select="$elt/node()" mode="mathml2tex"/>
      </xsl:when>
      <xsl:when test="$elt/self::mtext 
                      and normalize-space(string-join(($mathvariant, $fontstyle, $fontweight), '')) 
                      and not($mathvariant = 'normal')
                      and not(matches($elt, $texregex-upgreek))">
        <xsl:sequence select="mml2tex:style-to-tex-insert($elt, $mathvariant, $style-map, 'text')"/>
      </xsl:when>
      <xsl:when test="$elt/self::mtext">
        <xsl:text>\text{</xsl:text>
        <xsl:apply-templates select="$elt/node()" mode="mathml2tex"/>
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:when test="$elt/self::mi[. = $mml2tex:function-names][$mathvariant = 'normal']">
        <xsl:apply-templates select="$elt/node()" mode="mathml2tex"/>
      </xsl:when>
      <xsl:when test="($elt/self::mi or $elt/self::mn or $elt/self::ms or $elt/self::mo or $elt/self::mstyle) 
                      and normalize-space(string-join(($mathvariant, $fontstyle, $fontweight), '')) 
                      and not($elt/self::mi[not(@mathvariant or @mathvariant eq 'italic')] and string-length($elt) = 1)">
        <xsl:sequence select="if($elt/self::mi[matches(@mathvariant, 'italic') and string-length(.) = 1])
                              then mml2tex:style-to-tex-insert($elt, 'mml2tex_bold-italic', $style-map, 'math')
                              else mml2tex:style-to-tex-insert($elt, $mathvariant, $style-map, 'math')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="$elt/node()" mode="mathml2tex"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>
  
  <xsl:function name="mml2tex:style-to-tex-insert" as="item()*">
    <xsl:param name="elt" as="element()"/>
    <xsl:param name="mathvariant" as="xs:string?"/>
    <xsl:param name="style-map" as="element(mml2tex:styles)"/>
    <xsl:param name="target" as="xs:string"/>
    <xsl:value-of select="string-join((mml2tex:text-atts($elt, $target),
                                       for $i in tokenize($style-map/mml2tex:var[@mml eq $mathvariant]/@tex, '\s') 
                                       return ('\', 
                                               if($i = ('bm', 'boldsymbol')) then () else $target, $i, '{')
                                       ), '')"/>
    <xsl:apply-templates select="$elt/node()" mode="mathml2tex"/>
    <xsl:value-of select="string-join((for $i in tokenize($style-map/mml2tex:var[@mml eq $mathvariant]/@tex, '\s') 
                                       return '}', 
                                       if(mml2tex:text-atts($elt, $target)) then '}' else ()), 
                                       '')"/>
  </xsl:function>

  <xsl:template match="mglyph" mode="mathml2tex">
    <xsl:message>[WARNING]: mglyph (<xsl:copy-of select="."/>)</xsl:message>
    <xsl:if test="@alt">
      <xsl:value-of select="@alt"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="mn|mi|ms|mo|mtext|mstyle" mode="mathml2tex">
    <xsl:sequence select="mml2tex:style-to-tex(.)"/>
  </xsl:template>
  
  <xsl:template match="processing-instruction()[local-name() eq 'latex']" mode="mathml2tex">
    <xsl:value-of select="."/>
  </xsl:template>
    
  
</xsl:stylesheet>
