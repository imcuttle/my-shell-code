const AwaitEventEmitter = require('await-event-emitter')
 
const emitter = new AwaitEventEmitter()
const tick = () => 
  new Promise(resolve => {
    setTimeout(() => {
      console.log('tick')
      resolve()
    }, 1000)
  })
 
emitter
  .on('event', async () => {
    // wait to print
    console.log('sss')
    await tick()
  })
 
async function run() {
  // NOTE: it's important to `await` the reset process
  await emitter.emit('event', '...arguments')
  await emitter.emit('event', 'again')
}
 
run()
