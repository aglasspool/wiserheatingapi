% rebase('base.tpl')
<div class="cards">

   <article class="card">
    <header>
      <h2>Heating Control</h2>
    </header>
     <img
      src="/static/images/fieldingstreet.jpg"
      alt="Boost image" /> 

<footer>
    % if defined('ip'):
  <p>Heating last boosted by {{ ip }} on {{ start }}</p>
    % end
    </footer>
 
  </article>

 <article class="card">
    <header>
      <h2>Basement Kitchen</h2>
    </header>
    <img
      src="/static/images/downstairskitchen.JPG"
      alt="Downstairs Kitchen image" />
       <div class="content">
     <form action="/bkitchen" method="post">
    <input value="Boost Heating!" type="submit" />
</form>
    </div>
 
    <footer>Temperature: {{room3Temp}}°C</footer>
  </article>
 <article class="card">
    <header>
      <h2>Basement Bedroom</h2>
    </header>
    <img
      src="/static/images/downstairsbedroom.JPG"
      alt="Downstairs Bedroom image" />
       <div class="content">
     <form action="/bbedroom" method="post">
    <input value="Boost Heating!" type="submit" />
</form>
    </div>
 
    <footer>Temperature: {{room2Temp}}°C</footer>
  </article>

  <article class="card">
    <header>
      <h2>Upstairs Lounge</h2>
    </header>
    <img
      src="/static/images/upstairslounge.jpg"
      alt="Upstairs Lounge image" />
             <div class="content">
     <form action="/thermostat" method="post">
    <input value="Boost Heating!" type="submit" />
</form>
    </div>
    <footer>
 
    <footer>Temperature: {{room1Temp}}°C</footer>
  </article>



