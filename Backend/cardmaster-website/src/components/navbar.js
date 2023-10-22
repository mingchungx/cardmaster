import logo from "../logo.svg";

function Nav() {
  return (
    <div className="container mx-auto flex justify-between items-center w-[90%] h-[10%] p-[1rem]">
        <img src={logo} alt = "logo" className="h-[50%]"/> 
        <ul class="flex space-x-4">
            <li><a href="#" className="text-black">Home</a></li>
            <li><a href="#" className="text-black">About</a></li>
            <li><a href="#" className="text-black">Services</a></li>
            <li><a href="#" className="text-black">Contact</a></li>
        </ul>
    </div>
  );
}

export default Nav;
