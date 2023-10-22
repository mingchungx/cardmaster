import Nav from "./components/navbar"
import trades from "./trades.svg"
import Hover from 'react-3d-hover';
import c1 from "./img/c1.png"
import c2 from "./img/c2.png"
import c3 from "./img/c3.png"
import c4 from "./img/c4.png"


const images = [{img: c1, name: "Chase Sapphire", rewards: ["$200 Signup Bonus", "1% Cashback on American Airlines"]}, {img: c2, name: "Discover", rewards: ["$100 Signup Bonus with Referral", "1% Cashback on American Airlines"]}, {img: c3, name:"American Express Magnet Card", rewards: ["$250 Signup Bonus", "1% Cashback on American Airlines"]}, {img: c4, name: "Delta SkyMiles Blue", rewards: ["$200 Signing Bonus", "Earn 3 miles per dollar on Delta purchases"]}]

function App() {
  return (
    <div class="bg-hero-pattern bg-cover bg-center h-screen content-between">
      <Nav />
      <div class="w-[90%] mx-auto flex, flex-column">
        <img class="w-[40%] mt-[2rem]" src={trades} alt="become the jack of all cards"></img>
        <p class="text-2xl mt-[2rem]"> credit churning at your fingertips <br /> 
        get best credit cards rewards personalized for you </p>
        <button class="cursor-pointer mt-[2rem] bg-black text-white p-[1rem]"> Get Started → </button>
        <div className="image-gallery" class="flex flex-row flex-wrap justify-center mx-auto mt-[2rem] w-2/3 bg-white p-5 rounded-xl bg-opacity-30 backdrop-filter backdrop-blur-xl border-2 border-white border-opacity-20">
          {images.map((image, index) => (
            <div key={index} class="w-[40%] m-[0.5rem] bg-white p-5 rounded-xl bg-opacity-30 backdrop-filter backdrop-blur-xl border-2 border-white border-opacity-20">
              <Hover scale={1.05} perspective={900} speed={500}>
                <img key={index} src={image.img} class="w-inherit shadow-none hover:shadow-xl border-none rounded-xl" />
              </Hover>
              <h1 class="mt-[1rem] font-bold">{image.name}</h1>
              <h1 class="mt-[1rem] font-medium">Rewards offered: </h1>
              <ul>
              {image.rewards.map((reward, i)=>(
                  <li>{reward}</li>
              ))}
              </ul>

            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

export default App;
