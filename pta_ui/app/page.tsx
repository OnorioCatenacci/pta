//import Image from "next/image";

export default function Home() {
  return (
    <main>
      <form>
        <h1 class="text-center text-red-600 text-3xl">Add An Event</h1>
        <div class="content-start grid grid-cols-3">
          <div>
            <label class="text-left text-blue-700" for="event_venue">Event Venue: </label>
            <select name="event_venue" id="event_venue">
              <option value="1">Fox Theater</option>
              <option value="2">Comerica Park</option>
              <option value="3">Pine Knob Music Theater</option>
              <option value="4">Freedom Hill</option>
            </select>
          </div>
          <div>
            <label class="text-left text-blue-700" for="event_name">Event Name: </label>
            <input type="text" id="event_name" required />
          </div>
          <div>
            <label class="text-left text-blue-700" for="event_date">Event Date: </label>
            <input type="date" id="event_date" required />
          </div>
          <div>
            <label class="text-left text-blue-700" for="event_start_time">Event Starting Time: </label>
            <input type="time" id="event_start_time" required />
          </div>
        </div>
      </form>
    </main>
  );
}
