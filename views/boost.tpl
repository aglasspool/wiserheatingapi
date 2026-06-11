% rebase('base.tpl')
<div class="max-w-screen-xl mx-auto p-5 sm:p-10 md:p-16">
    <div class="grid grid-cols-1 md:grid-cols-3 sm:grid-cols-2 gap-10">

 <div class="rounded overflow-hidden shadow-lg bg-[#C1E1C1]">
            <a href="#"></a>
            <div class="relative">
                <a href="#">
                    <img class="w-full"
                        src="static/images/fieldingstreet.jpg"
                        alt="Fielding Street">
                    <div
                        class="hover:bg-transparent transition duration-300 absolute bottom-0 top-0 right-0 left-0 bg-gray-900 opacity-25">
                    </div>
                </a>
               

                
                    <div
                        class="text-sm absolute top-0 right-0 bg-indigo-600 px-4 text-white rounded-full h-16 w-16 flex flex-col items-center justify-center mt-3 mr-3 hover:bg-white hover:text-indigo-600 transition duration-500 ease-in-out">
                        <span class="font-bold">{{current_temperature}}°</span>
                        <small>London</small>
                    </div>
                
            </div>
            <div class="px-6 py-4">

                <a href="#"
                    class="font-semibold text-lg inline-block hover:text-indigo-600 transition duration-500 ease-in-out">Heating Control System</a>
                    % if defined('ip'):
<p class="text-gray-500 text-sm">Heating last boosted by {{ ip }} on {{ start }}</p>
                    % end
               
            </div>
            
        </div>



        <div class="rounded overflow-hidden shadow-lg bg-[#C1E1C1]">

            <a href="#"></a>
            <div class="relative">
                <a href="#">
                    <img class="w-full"
                        src="/static/images/downstairskitchen.JPG"
                        alt="Sunset in the mountains">
                    <div
                        class="hover:bg-transparent transition duration-300 absolute bottom-0 top-0 right-0 left-0 bg-gray-900 opacity-25">
                    </div>
                </a>
                
                    <div
                        class="absolute bottom-0 left-0 bg-indigo-600 px-4 py-2 text-white text-sm hover:bg-white hover:text-indigo-600 transition duration-500 ease-in-out">
                        <form action="/bkitchen" method="post">
    <input value="Boost Kitchen!" type="submit" />
</form>
                    </div>
                

                
                    <div
                        class="text-sm absolute top-0 right-0 bg-indigo-600 px-4 text-white rounded-full h-16 w-16 flex flex-col items-center justify-center mt-3 mr-3 hover:bg-white hover:text-indigo-600 transition duration-500 ease-in-out">
                        <span class="font-bold">{{room2Temp}}°</span>
                        
                    </div>
                
            </div>
            <div class="px-6 py-4">

                <a href="#"
                    class="font-semibold text-lg inline-block hover:text-indigo-600 transition duration-500 ease-in-out">Basement Kitchen</a>
                    
                  
            </div>
          
        </div>
        <div class="rounded overflow-hidden shadow-lg bg-[#C1E1C1]">
            <a href="#"></a>
            <div class="relative">
                <a href="#">
                    <img class="w-full"
                        src="static/images/downstairsbedroom.JPG"
                        alt="Sunset in the mountains">
                    <div
                        class="hover:bg-transparent transition duration-300 absolute bottom-0 top-0 right-0 left-0 bg-gray-900 opacity-25">
                    </div>
                </a>
                
                    <div
                        class="absolute bottom-0 left-0 bg-indigo-600 px-4 py-2 text-white text-sm hover:bg-white hover:text-indigo-600 transition duration-500 ease-in-out">
                        <form action="/bbedroom" method="post">
    <input value="Boost Bedroom!" type="submit" />
</form>
                    </div>
                

                
                    <div
                        class="text-sm absolute top-0 right-0 bg-indigo-600 px-4 text-white rounded-full h-16 w-16 flex flex-col items-center justify-center mt-3 mr-3 hover:bg-white hover:text-indigo-600 transition duration-500 ease-in-out">
                        <span class="font-bold">{{room3Temp}}°</span>
                    </div>
               
            </div>
            <div class="px-6 py-4">

                <a href="#"
                    class="font-semibold text-lg inline-block hover:text-indigo-600 transition duration-500 ease-in-out">Basement Bedroom</a>
                   
               
            </div>
            
        </div>
        <div class="rounded overflow-hidden shadow-lg bg-[#C1E1C1]">

            <a href="#"></a>
            <div class="relative">
                <a href="#">
                    <img class="w-full"
                        src="static/images/upstairslounge.jpg"
                        alt="Sunset in the mountains">
                    <div
                        class="hover:bg-transparent transition duration-300 absolute bottom-0 top-0 right-0 left-0 bg-gray-900 opacity-25">
                    </div>
                </a>
                <a href="#!">
                    <div
                        class="absolute bottom-0 left-0 bg-indigo-600 px-4 py-2 text-white text-sm hover:bg-white hover:text-indigo-600 transition duration-500 ease-in-out">
                        <form action="/thermostat" method="post">
    <input value="Boost Lounge!" type="submit" />
                    </div>
                </a>

                
                    <div
                        class="text-sm absolute top-0 right-0 bg-indigo-600 px-4 text-white rounded-full h-16 w-16 flex flex-col items-center justify-center mt-3 mr-3 hover:bg-white hover:text-indigo-600 transition duration-500 ease-in-out">
                        <span class="font-bold">{{room1Temp}}°</span>
                    </div>
               
            </div>
            <div class="px-6 py-4">

                <a href="#"
                    class="font-semibold text-lg inline-block hover:text-indigo-600 transition duration-500 ease-in-out">Upstairs Lounge</a>
                    
            </div>
            
        </div>
    </div>
</div>

