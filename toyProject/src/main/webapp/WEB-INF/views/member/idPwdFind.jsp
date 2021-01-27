<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jquery.easing.1.3.js"></script>
    <script src="../js/jquery.mousewheel.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/idPwdFind.css">

</head>


<body>
<!--ì ì²´-->
<div id="all-wrap">
   

    <!--ì½íì¸ -->


    <div id="content-wrap">
    
       

        <nav>
            
                <h1>ë¶ê° ìë¹ì¤</h1>
                <ul id="member-tab">
                    <li ><a>ë¡ê·¸ì¸</a></li>
                    <li id="click-menu"><a>ìì´ë*ë¹ë°ë²í¸ì°¾ê¸°</a></li>
                    <li><a>íìê°ì</a></li>
                    <li><a>ê°ì¸ì ë³´ì²ë¦¬ë°©ì¹¨</a></li>
                    <li><a>ì´ì©ì½ê´</a></li>
                    <li><a>ì´ë©ì¼ ë¬´ë¨ìì§ ê±°ë¶</a></li>
                    <li><a>ììì ë³´ì²ë¦¬ê¸°ê¸° ì´ìê´ë¦¬</a></li>
                </ul>


        </nav>

        <section>
        
            <h2>ìì´ë ë¹ë°ë²í¸ì°¾ê¸°</h2>
            <article>
                    <h3>ìì´ëì°¾ê¸°</h3>
                <div id="login-window">
                    

                    <form action="#" method="get">
                        <label for="name">ì´ ë¦</label>
                        <input type="text" id="name" name="name" class="login-input" placeholder="ì´ë¦ ìë ¥ì°½"/>
                        
                        <label for="name">ì´ë©ì¼ ìë ¥ì°½</label>
                        <input type="email" id="email" name="email" class="login-input" placeholder="ì´ë©ì¼ ìë ¥ì°½"/>
                        <input type="submit" class="login-input" value="ìì´ëì°¾ê¸°"/>
                        <p id="id-find-result"></p>
                    </form>


                </div>
            </article>
           

            <article>
                    <h3>ë¹ë°ë²í¸ ì°¾ê¸°</h3>
                <div id="login-window">
                    

                    <form action="#" method="get">

                        <label for="id">ìì´ë</label>
                        <input type="text" id="id" name="id" class="login-input" placeholder="ìì´ë ìë ¥ì°½"/>

                        <label for="name">ì´ ë¦</label>
                        <input type="text" id="name" name="name" class="login-input" placeholder="ì´ë¦ ìë ¥ì°½"/>
                        
                        <label for="name">ì´ë©ì¼ ìë ¥ì°½</label>
                        <input type="email" id="email" name="email" class="login-input" placeholder="ì´ë©ì¼ ìë ¥ì°½"/>
                        <input type="submit" class="login-input" value="ë¹ë°ë²í¸ ì°¾ê¸°"/>
                        <p id="pwd-find-result"></p>
                    </form>


                </div>
            </article>
        
        </section>

      



    </div>
    <!--//ì½íì¸ -->

</body>
</html>