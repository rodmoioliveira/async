use futures::executor::block_on;

async fn learn_song() -> String {
    "Learning song!".to_string()
}
async fn sing_song(song: String) {
    eprintln!("{}", song);
}

async fn dance() {
    eprintln!("dance!");
}

fn main() {
    let song = block_on(learn_song());
    block_on(sing_song(song));
    block_on(dance());
}
