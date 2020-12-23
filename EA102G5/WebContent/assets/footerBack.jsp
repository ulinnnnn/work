<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>後台Footer</title>
    

<style>
*, *:before, *:after {
  box-sizing: border-box;
}

html {
  font-size: 100%;
}

body {
  font-family: acumin-pro, system-ui, sans-serif;
  margin: 0;
  display: grid;
  grid-template-rows: auto 1fr auto;
  font-size: 14px;
  background-color: #f4f4f4;
  align-items: start;
  min-height: 100vh;
}

.footer {
  display: flex;
  flex-flow: row wrap;
  padding: 30px 20px 20px 10px;
  color: #fff; 
  font-color:#fff; 
  background-color: rgba(0,0,0,0.85);
  border-top: 1px solid #e5e5e5;
  font-family: Microsoft JhengHei;
}

.footer > * {
  flex:  1 100%;
}

.footer__addr {
/*   margin-left:5%; */
  margin-right:0;
  margin-bottom: 2em;
}

.footer__logo {
  font-family: Microsoft JhengHei, cursive;
  font-weight: 400;
  text-transform: lowercase;
  font-size: 1.5rem;
  color: #fff; 
}

.footer__addr h2 {
  margin-top: 1.3em;
  font-size: 15px;
  font-weight: 400;
}

.nav__title {
  font-weight: 400;
  font-size: 15px;
}

.footer address {
  font-style: normal;
  color: #999;
}

.footer__btn {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 36px;
  max-width: max-content;
  background-color:  #ff8c1a;
  border-radius: 100px;
  color: #fff; 
  line-height: 0;
  margin: 0.6em 0;
  font-size: 1rem;
  font-weight:bold;
  padding: 0 1.3em;
}

.footer ul {
  list-style: none;
  padding-left: 0;
}

.footer li {
  line-height: 2em;
}

.footer a {
  text-decoration: none;
}

.footer__nav {
  color:#fff;
  display: flex;
  flex-flow: row wrap;
}

.footer__nav > * {
  flex: 1 50%;
  margin-right: 1.25em;
}

.nav__ul a {
  color: #fff;
}

.nav__ul--extra {
  column-count: 2;
  column-gap: 1.25em;
}

.legal {
  display: flex;
  flex-wrap: wrap;
  color: #fff;
}
  
.legal__links {
  display: flex;
  align-items: center;
}

.heart {
  color: #2f2f2f;
}

@media screen and (min-width: 24.375em) {
  .legal .legal__links {
    margin-left: auto;
  }
}

@media screen and (min-width: 40.375em) {
  .footer__nav > * {
    flex: 1;
  }
  
  .nav__item--extra {
    flex-grow: 2;
  }
  
  .footer__addr {
    flex: 1 0px;
  }
  
  .footer__nav {
    flex: 2 0px;
  }
}

.footer h2{
	font-size:18px;
    font-weight:bold;
	color:#ffffcc;
}

.footer h1{
    font-weight:bold;
	color:#ff944d;
}
</style>
</head>
<body>
<header>
  <!-- Content -->
</header>

<main>
  <!-- Content -->
</main>

<footer class="footer">
  <div class="footer__addr">
    <h1 class="footer__logo">「初音不是軟體」大遊行</h1>
        
    <h2>他們說初音是軟體，這口氣你嚥得下去??</h2> 
    
    <address>
    	破除謠言，捍衛真理，初音並不是軟體！
      <br>
          
      <a class="footer__btn" href="mailto:example@gmail.com">我要報名</a>
    </address>
  </div>
  
  <ul class="footer__nav">
    <li class="nav__item">
      <h2 class="nav__title">三大訴求</h2>

      <ul class="nav__ul">
        <li>
          <a href="#">1.將「初音不是軟體」寫入憲法</a>
        </li>

        <li>
          <a href="#">2.修法重罰散布「初音是軟體」之言論者</a>
        </li>
            
        <li>
          <a href="#">3.提高科研預算，加速初音實體化之進程</a>
        </li>
      </ul>
    </li>
    
    
    <li class="nav__item nav__item--extra">
      <h2 class="nav__title" >注意事項</h2>
      
      <ul class="nav__ul">
        <li>
          <a href="#">1.活動當天將發放雞排+珍奶，每人限領乙份</a>
        </li>
        
        <li>
          <a href="#">2.當天將對每位參與者抽考初音歌曲+舞步，以防不明人士混入</a>
        </li>
        
        <li>
          <a href="#">3.本單位備有1000份行動電源，提供大家幫老婆充電</a>
        </li>
<!--          <li> -->
<!--           <a href="#">4.單馬尾派、雙馬尾派、長髮派，此時切勿互鬥內耗，要知道，這是Miku最艱困的時刻，我們絕對要團結一心，齊力對外</a> -->
<!--         </li> -->
      </ul>
    </li>
    
    <li class="nav__item">
      <h2 class="nav__title">活動詳情</h2>
      
      <ul class="nav__ul">
        <li>
          <a href="#">集合地點：東沙群島 東沙機場候機室</a>
        </li>
        <li>
          <a href="#">遊行終點：凱達格蘭大道(總統府前)</a>
        </li>
         <li>
          <a href="#">活動時間：2020.09.18 上午9:00</a>
        </li>
      </ul>
    </li>
    
  </ul>
  
<!--   <div class="legal"> -->
<!--     <p>&copy; 2020 EA102G5. All rights reserved.</p> -->
    
<!--     <div class="legal__links"> -->
<!--       <span>Made with <span class="heart"></span> remotely from Anywhere</span> -->
<!--     </div> -->
<!--   </div> -->
</footer>
</body>
</html>