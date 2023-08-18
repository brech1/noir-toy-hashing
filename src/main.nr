use dep::std::println;

global PRIME: u32 = 16777619;

fn main(value: u32, hash_value: pub u32){
    let calculated_hash_value = calculate_hash(value);

    assert(calculated_hash_value == hash_value);
}

fn calculate_hash(num: u32) -> u32 {    
    println("Input");
    println(num);

    let mut hash_value: u32 = 0x811C9DC5;

    let mut num_bytes: [u8;4] = [0; 4];
    for i in 0..4 {
        num_bytes[i] = (num >> (i * 8)) as u8;
    }

    println("Input bytes");
    println(num_bytes);

    for byte in num_bytes {
        let product = hash_value * PRIME;

        // TODO: Implement modulo op

        println("Product");
        println(product);

        hash_value = product ^ byte as u32;
    }
    
    println("Final hash");
    println(hash_value);

    hash_value
}

#[test]
fn test_1() {
    let num = 127561628;
    let hash = calculate_hash(num);
    
    assert(hash == 0x71233de7);
}

#[test]
fn test_2() {
    let num = 237261828;
    let hash = calculate_hash(num);

    assert(hash == 0x7F51D567);
}

#[test]
fn test_3() {
    let num = 596214892;
    let hash = calculate_hash(num);

    assert(hash == 0x3F0C8995);
}
